#region Using directives

using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

using Tenpow.Collections.Generic;

using NUnit.Core;
using NUnit.Framework;

#endregion

namespace XaeiO.Compiler.Collections
{    
    public class CFGNodeSet : ICollection<CFGNode>, IEnumerable<CFGNode>, ICloneable
    {
        private const int DefaultCapacity = 128;

        public CFG CFG
        {
            get;
            private set;
        }
        private ulong[] _indices;
        private Set<CFGNode> _data;

        public CFGNode this[int index]
        {
            get
            {
                int i = 0;
                foreach (CFGNode element in this)
                {
                    if (i++ == index)
                    {
                        return element;
                    }
                }
                throw new IndexOutOfRangeException();
            }
        }

        public CFGNodeSet(CFG cfg)
        {
            _indices = new ulong[DefaultCapacity / 64];
            _data = null;
            CFG = cfg;
        }

        public CFGNodeSet(CFG cfg, ICollection<CFGNode> elements)
        {
            int initialCapacity = Math.Max(elements.Count + 64, DefaultCapacity);
            _indices = new ulong[initialCapacity / 64];
            _data = null;
            CFG = cfg;
            foreach (CFGNode element in elements)
            {
                Add(element);
            }
        }

        public CFGNodeSet(CFGNode node) : this(node.Graph)
        {
            Add(node);
        }

        private CFGNodeSet()
        {
        }

        private void Grow()
        {
            Grow(2);
        }

        private void Grow(int factor)
        {
            ulong[] newIndices = new ulong[_indices.Length * factor];
            for (int i = 0; i < _indices.Length; i++)
            {
                newIndices[i] = _indices[i];
            }
            _indices = newIndices;
        }

        private void FillData()
        {
            if (null != (object)_data)
            {
                return;
            }
            Set<CFGNode> newData = new Set<CFGNode>();
            foreach (CFGNode node in CFG.Vertices)
            {
                if (Contains(node))
                {
                    newData.Add(node);
                }
            }
            _data = newData;
        }

        #region Operators
        public static CFGNodeSet operator &(CFGNodeSet a, CFGNodeSet b)
        {
            if (a.CFG != b.CFG)
            {
                throw new ArgumentException("CFGs must be the same");
            }
            CFGNodeSet longer, shorter;
            if (a._indices.Length > b._indices.Length)
            {
                longer = a;
                shorter = b;
            }
            else
            {
                longer = b;
                shorter = a;
            }

            ulong[] newIndices = new ulong[shorter._indices.Length];
            for (int i = 0; i < shorter._indices.Length; i++)
            {
                newIndices[i] = shorter._indices[i] & longer._indices[i];
            }

            CFGNodeSet result = new CFGNodeSet();
            result._indices = newIndices;
            result.CFG = a.CFG;

            return result;
        }
        public static CFGNodeSet operator ^(CFGNodeSet a, CFGNodeSet b)
        {
            if (a.CFG != b.CFG)
            {
                throw new ArgumentException("CFGs must be the same");
            }
            CFGNodeSet longer, shorter;
            if (a._indices.Length > b._indices.Length)
            {
                longer = a;
                shorter = b;
            }
            else
            {
                longer = b;
                shorter = a;
            }

            ulong[] newIndices = new ulong[longer._indices.Length];
            for (int i = 0; i < shorter._indices.Length; i++)
            {
                newIndices[i] = shorter._indices[i] ^ longer._indices[i];
            }
            for (int i = shorter._indices.Length; i < longer._indices.Length; i++)
            {
                newIndices[i] = longer._indices[i];
            }

            CFGNodeSet result = new CFGNodeSet();
            result._indices = newIndices;
            result.CFG = a.CFG;

            return result;
        }
        public static CFGNodeSet operator |(CFGNodeSet a, CFGNodeSet b)
        {
            return a + b;
        }

        public static CFGNodeSet operator +(CFGNodeSet a, CFGNodeSet b)
        {
            if (a.CFG != b.CFG)
            {
                throw new ArgumentException("CFGs must be the same");
            }
            CFGNodeSet longer, shorter;
            if (a._indices.Length > b._indices.Length)
            {
                longer = a;
                shorter = b;
            }
            else
            {
                longer = b;
                shorter = a;
            }

            ulong[] newIndices = new ulong[longer._indices.Length];
            for (int i = 0; i < shorter._indices.Length; i++)
            {
                newIndices[i] = shorter._indices[i] | longer._indices[i];
            }
            for (int i = shorter._indices.Length; i < longer._indices.Length; i++)
            {
                newIndices[i] = longer._indices[i];
            }

            CFGNodeSet result = new CFGNodeSet();
            result._indices = newIndices;
            result.CFG = a.CFG;

            return result;
        }
        public static CFGNodeSet operator -(CFGNodeSet a, CFGNodeSet b)
        {
            if (a.CFG != b.CFG)
            {
                throw new ArgumentException("CFGs must be the same");
            }
            int min = Math.Min(a._indices.Length, b._indices.Length);
            ulong[] newIndices = new ulong[a._indices.Length];
            for (int i = 0; i < min; i++)
            {
                newIndices[i] = a._indices[i] & ~b._indices[i];
            }

            if (a._indices.Length > b._indices.Length)
            {
                for (int i = b._indices.Length; i < a._indices.Length; i++)
                {
                    newIndices[i] = a._indices[i];
                }
            }

            CFGNodeSet result = new CFGNodeSet();
            result._indices = newIndices;
            result.CFG = a.CFG;

            return result;
        }

        public static bool operator ==(CFGNodeSet a, CFGNodeSet b)
        {
            if (a.CFG != b.CFG)
            {
                throw new ArgumentException("CFGs must be the same");
            }
            CFGNodeSet longer, shorter;
            if (a._indices.Length > b._indices.Length)
            {
                longer = a;
                shorter = b;
            }
            else
            {
                longer = b;
                shorter = a;
            }

            // make sure that the indices that these two sets share are equal
            for (int i = 0; i < shorter._indices.Length; i++)
            {
                if (shorter._indices[i] != longer._indices[i])
                {
                    return false;
                }
            }

            // make sure that the rest of the indices in longer are 0
            for (int i = shorter._indices.Length; i < longer._indices.Length; i++)
            {
                if (longer._indices[i] != 0)
                {
                    return false;
                }
            }
            return true;
        }

        public static bool operator !=(CFGNodeSet a, CFGNodeSet b)
        {
            return !(a == b);
        }
        #endregion

        #region ICollection<CFGNode> Members

        public void Add(CFGNode item)
        {
            if (CFG != item.Graph)
            {
                throw new ArgumentException("CFGs must be the same");
            }
            int id = item.ID;
            if (id / 64 >= _indices.Length)
            {
                Grow(((id / 64) / _indices.Length) + 1);
            }
            ulong index = _indices[id / 64];
            ulong mask = ((ulong)1) << id % 64;

            // is this node ID in the index?
            if ((index & mask) == 0)
            {
                // no, so add the node
                index |= mask;
                _indices[id / 64] = index;
                _data = null;
            }
        }

        public void Clear()
        {
            for (int i = 0; i < _indices.Length; i++)
            {
                _indices[i] = 0;
            }
            _data = null;
        }

        public bool Contains(CFGNode item)
        {
            int id = item.ID;
            if (id / 64 >= _indices.Length)
            {
                return false;
            }
            ulong index = _indices[id / 64];
            ulong mask = ((ulong)1) << id % 64;

            // is this node ID in the index?
            return (index & mask) != 0;
        }

        public void CopyTo(CFGNode[] array, int arrayIndex)
        {
            throw new NotImplementedException();
        }

        public int Count
        {
            get
            {
                int count = 0;
                for (int i = 0; i < _indices.Length; i++)
                {
                    ulong index = _indices[i];
                    do
                    {
                        if ((index & 1) != 0)
                        {
                            count++;
                        }
                        index = index >> 1;
                    } while (index > 0);
                }
                return count;
            }
        }

        public bool IsReadOnly
        {
            get { return false; }
        }

        public bool Remove(CFGNode item)
        {
            if (CFG != item.Graph)
            {
                throw new ArgumentException("CFGs must be the same");
            }
            int id = item.ID;
            ulong index = _indices[id / 64];
            ulong mask = ((ulong)1) << id % 64;

            // remove this node ID from the index
            _indices[id / 64] &= ~mask;

            if ((index & mask) != 0)
            {
                _data = null;
                return true;
            }
            else
            {
                return false;
            }
        }

        #endregion

        #region IEnumerable<CFGNode> Members

        public IEnumerator<CFGNode> GetEnumerator()
        {
            FillData();
            return _data.GetEnumerator();
        }

        #endregion

        #region IEnumerable Members

        IEnumerator IEnumerable.GetEnumerator()
        {
            FillData();
            return ((IEnumerable)_data).GetEnumerator();
        }

        #endregion

        #region ICloneable Members

        public CFGNodeSet Clone()
        {
            CFGNodeSet clone = new CFGNodeSet();
            clone.CFG = CFG;
            clone._indices = new ulong[_indices.Length];
            for (int i = 0; i < _indices.Length; i++)
            {
                clone._indices[i] = _indices[i];
            }
            if (null != (object)_data)
            {
                clone._data = _data.Clone();
            }
            return clone;
        }

        object ICloneable.Clone()
        {
            return Clone();
        }

        #endregion

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            foreach (CFGNode node in this)
            {
                sb.Append(node.ID);
                sb.Append(",");
            }
            sb.Append("}");
            return sb.ToString();
        }
    }


    #region Tests

    [TestFixture]
    public class Tests
    {
        [Test]
        public void TestAddRemoveAndCount()
        {
            CFG cfg = new CFG();
            CFGNode a = cfg.AddNode();
            CFGNode b = cfg.AddNode();
            CFGNode c = cfg.AddNode();
            CFGNodeSet set = new CFGNodeSet(cfg);
            set.Add(a);
            set.Add(b);
            set.Add(c);
            Assert.AreEqual(3, set.Count);
            set.Remove(a);
            Assert.AreEqual(2, set.Count);
        }

        [Test]
        public void TestAddRemoveAndContains()
        {
            CFG cfg = new CFG();
            CFGNode a = cfg.AddNode();
            CFGNode b = cfg.AddNode();
            CFGNode c = cfg.AddNode();
            CFGNodeSet set = new CFGNodeSet(cfg);
            set.Add(a);
            set.Add(b);
            set.Add(c);
            Assert.IsTrue(set.Contains(a));
            Assert.IsTrue(set.Contains(b));
            Assert.IsTrue(set.Contains(c));
            set.Remove(a);
            Assert.IsFalse(set.Contains(a));
            Assert.IsTrue(set.Contains(b));
            Assert.IsTrue(set.Contains(c));
        }

        [Test]
        public void TestAddAndRemove()
        {
            CFG cfg = new CFG();
            CFGNode a = cfg.AddNode();
            CFGNode b = cfg.AddNode();
            CFGNode c = cfg.AddNode();
            CFGNodeSet set = new CFGNodeSet(cfg);
            set.Add(a);
            set.Add(b);
            set.Add(c);
            set.Remove(b);
            set.Remove(a);
            set.Add(b);
            Assert.AreEqual(2, set.Count);
            Assert.IsTrue(set.Contains(b));
            Assert.IsTrue(set.Contains(c));
            Assert.IsFalse(set.Contains(a));
        }

        [Test]
        public void TestClear()
        {
            CFG cfg = new CFG();
            CFGNode a = cfg.AddNode();
            CFGNode b = cfg.AddNode();
            CFGNode c = cfg.AddNode();
            CFGNodeSet set = new CFGNodeSet(cfg);
            set.Add(a);
            set.Add(b);
            set.Add(c);
            set.Clear();
            Assert.AreEqual(0, set.Count);
            Assert.IsFalse(set.Contains(a));
            Assert.IsFalse(set.Contains(b));
            Assert.IsFalse(set.Contains(c));
        }

        [Test]
        public void TestAnd()
        {
            CFG cfg = new CFG();
            CFGNode a = cfg.AddNode();
            CFGNode b = cfg.AddNode();
            CFGNode c = cfg.AddNode();

            CFGNodeSet set1 = new CFGNodeSet(cfg);
            set1.Add(a);
            set1.Add(b);
            set1.Add(c);

            CFGNodeSet set2 = new CFGNodeSet(cfg);
            set2.Add(a);

            CFGNodeSet set = set1 & set2;

            Assert.AreEqual(1, set.Count);
            Assert.IsTrue(set.Contains(a));
            Assert.IsFalse(set.Contains(b));
            Assert.IsFalse(set.Contains(c));

            set1.Clear();
            set2.Clear();

            set1.Add(a);
            set1.Add(c);
            set2.Add(b);

            set = set1 & set2;
            Assert.AreEqual(0, set.Count);
            Assert.IsFalse(set.Contains(a));
            Assert.IsFalse(set.Contains(b));
            Assert.IsFalse(set.Contains(c));

            set1.Clear();
            set2.Clear();

            set1.Add(a);
            set1.Add(b);
            set1.Add(c);
            set2.Add(a);
            set2.Add(b);
            set2.Add(c);

            set = set1 & set2;
            Assert.AreEqual(3, set.Count);
            Assert.IsTrue(set.Contains(a));
            Assert.IsTrue(set.Contains(b));
            Assert.IsTrue(set.Contains(c));
        }

        [Test]
        public void TestXor()
        {
            CFG cfg = new CFG();
            CFGNode a = cfg.AddNode();
            CFGNode b = cfg.AddNode();
            CFGNode c = cfg.AddNode();

            CFGNodeSet set1 = new CFGNodeSet(cfg);
            set1.Add(a);
            set1.Add(b);
            set1.Add(c);

            CFGNodeSet set2 = new CFGNodeSet(cfg);
            set2.Add(a);

            CFGNodeSet set = set1 ^ set2;

            Assert.AreEqual(2, set.Count);
            Assert.IsFalse(set.Contains(a));
            Assert.IsTrue(set.Contains(b));
            Assert.IsTrue(set.Contains(c));

            set1.Clear();
            set2.Clear();

            set1.Add(a);
            set1.Add(c);
            set2.Add(b);

            set = set1 ^ set2;
            Assert.AreEqual(3, set.Count);
            Assert.IsTrue(set.Contains(a));
            Assert.IsTrue(set.Contains(b));
            Assert.IsTrue(set.Contains(c));

            set1.Clear();
            set2.Clear();

            set1.Add(a);
            set1.Add(b);
            set1.Add(c);
            set2.Add(a);
            set2.Add(b);
            set2.Add(c);

            set = set1 ^ set2;
            Assert.AreEqual(0, set.Count);
            Assert.IsFalse(set.Contains(a));
            Assert.IsFalse(set.Contains(b));
            Assert.IsFalse(set.Contains(c));
        }

        [Test]
        public void TestPlus()
        {
            CFG cfg = new CFG();
            CFGNode a = cfg.AddNode();
            CFGNode b = cfg.AddNode();
            CFGNode c = cfg.AddNode();
            CFGNode d = cfg.AddNode();

            CFGNodeSet set1 = new CFGNodeSet(cfg);
            set1.Add(a);
            set1.Add(b);
            set1.Add(c);

            CFGNodeSet set2 = new CFGNodeSet(cfg);
            set2.Add(d);

            CFGNodeSet set = set1 + set2;

            Assert.AreEqual(4, set.Count);
            Assert.IsTrue(set.Contains(a));
            Assert.IsTrue(set.Contains(b));
            Assert.IsTrue(set.Contains(c));
            Assert.IsTrue(set.Contains(d));

            set1.Clear();
            set2.Clear();

            set1.Add(a);
            set1.Add(c);
            set2.Add(c);
            set2.Add(d);

            set = set1 + set2;
            Assert.AreEqual(3, set.Count);
            Assert.IsTrue(set.Contains(a));
            Assert.IsFalse(set.Contains(b));
            Assert.IsTrue(set.Contains(c));
            Assert.IsTrue(set.Contains(d));

            set1.Clear();
            set2.Clear();

            set1.Add(a);
            set1.Add(b);
            set1.Add(c);
            set2.Add(a);
            set2.Add(b);
            set2.Add(c);

            set = set1 | set2;
            Assert.AreEqual(3, set.Count);
            Assert.IsTrue(set.Contains(a));
            Assert.IsTrue(set.Contains(b));
            Assert.IsTrue(set.Contains(c));
        }

        [Test]
        public void TestMinus()
        {
            CFG cfg = new CFG();
            CFGNode a = cfg.AddNode();
            CFGNode b = cfg.AddNode();
            CFGNode c = cfg.AddNode();
            CFGNode d = cfg.AddNode();

            CFGNodeSet set1 = new CFGNodeSet(cfg);
            set1.Add(a);
            set1.Add(b);
            set1.Add(c);

            CFGNodeSet set2 = new CFGNodeSet(cfg);
            set2.Add(d);

            CFGNodeSet set = set1 - set2;

            Assert.AreEqual(3, set.Count);
            Assert.IsTrue(set.Contains(a));
            Assert.IsTrue(set.Contains(b));
            Assert.IsTrue(set.Contains(c));
            Assert.IsFalse(set.Contains(d));

            set1.Clear();
            set2.Clear();

            set1.Add(a);
            set1.Add(c);
            set2.Add(c);
            set2.Add(d);

            set = set1 - set2;
            Assert.AreEqual(1, set.Count);
            Assert.IsTrue(set.Contains(a));
            Assert.IsFalse(set.Contains(b));
            Assert.IsFalse(set.Contains(c));
            Assert.IsFalse(set.Contains(d));

            set1.Clear();
            set2.Clear();

            set1.Add(a);
            set1.Add(b);
            set1.Add(c);
            set1.Add(d);
            set2.Add(a);
            set2.Add(b);
            set2.Add(c);

            set = set1 - set2;
            Assert.AreEqual(1, set.Count);
            Assert.IsFalse(set.Contains(a));
            Assert.IsFalse(set.Contains(b));
            Assert.IsFalse(set.Contains(c));
            Assert.IsTrue(set.Contains(d));
        }

        [Test]
        public void TestEquals()
        {
            CFG cfg = new CFG();
            CFGNode a = cfg.AddNode();
            CFGNode b = cfg.AddNode();
            CFGNode c = cfg.AddNode();
            CFGNode d = cfg.AddNode();

            CFGNodeSet set1 = new CFGNodeSet(cfg);
            set1.Add(a);
            set1.Add(b);
            set1.Add(c);

            CFGNodeSet set2 = new CFGNodeSet(cfg);
            set2.Add(d);

            Assert.IsFalse(set1 == set2);
            Assert.IsTrue(set1 != set2);

            set1.Clear();
            set2.Clear();

            set1.Add(a);
            set1.Add(b);
            set2.Add(a);
            set2.Add(b);

            Assert.IsTrue(set1 == set2);
            Assert.IsFalse(set1 != set2);
        }

        [Test]
        public void TestAddWithMultipleIndices()
        {
            CFG cfg = new CFG();

            CFGNodeSet set1 = new CFGNodeSet(cfg);
            CFGNodeSet set2 = new CFGNodeSet(cfg);

            CFGNode[] nodes = new CFGNode[65536];
            for (int n = 0; n < nodes.Length; n++)
            {
                nodes[n] = cfg.AddNode();
            }

            int i;
            for (i = 0; i < nodes.Length / 16 + 2; i++)
            {
                set1.Add(nodes[i]);
            }
            for (; i < nodes.Length; i++)
            {
                set2.Add(nodes[i]);
            }

            Assert.IsTrue(set1 != set2);
            Assert.IsFalse(set1 == set2);

            set1 = new CFGNodeSet(cfg) + set2;

            Assert.IsTrue(set1 == set2);
            Assert.IsFalse(set1 != set2);
        }

        [Test]
        public void TestPlusWithMultipleIndices()
        {
            CFG cfg = new CFG();

            CFGNodeSet set1 = new CFGNodeSet(cfg);
            CFGNodeSet set2 = new CFGNodeSet(cfg);

            CFGNode[] nodes = new CFGNode[65536];
            for (int n = 0; n < nodes.Length; n++)
            {
                nodes[n] = cfg.AddNode();
            }

            int i;
            for (i = 0; i < nodes.Length / 16 + 2; i++)
            {
                set1.Add(nodes[i]);
            }
            for (; i < nodes.Length; i++)
            {
                set2.Add(nodes[i]);
            }

            CFGNodeSet set = set1 + set2;

            Assert.AreEqual(nodes.Length, set.Count);
            foreach (CFGNode node in nodes)
            {
                Assert.IsTrue(set.Contains(node));
            }
        }

        /// <summary>
        /// Make sure that two CFGNodeSets with the same contents are still "=="
        /// when one has a larger index array than the other.
        /// </summary>
        [Test]
        public void TestEqualsWithMultipleIndices()
        {
            CFG cfg = new CFG();

            CFGNodeSet set1 = new CFGNodeSet(cfg);
            CFGNodeSet set2 = new CFGNodeSet(cfg);

            CFGNode[] nodes = new CFGNode[65536];
            for (int n = 0; n < nodes.Length; n++)
            {
                nodes[n] = cfg.AddNode();
            }

            int i;
            for (i = 0; i < nodes.Length / 16 + 2; i++)
            {
                set1.Add(nodes[i]);
                set2.Add(nodes[i]);
            }
            for (; i < nodes.Length; i++)
            {
                // add and remove nodes to make set2 call Grow(...)
                set2.Add(nodes[i]);
                set2.Remove(nodes[i]);
            }

            Assert.IsTrue(set1 == set2);
        }

        [Test]
        public void TestClone()
        {
            CFG cfg = new CFG();

            CFGNodeSet set = new CFGNodeSet(cfg);

            CFGNode[] nodes = new CFGNode[65536];
            for (int i = 0; i < nodes.Length; i++)
            {
                nodes[i] = cfg.AddNode();
            }

            for (int i = 0; i < nodes.Length; i++)
            {
                set.Add(nodes[i]);
            }

            CFGNodeSet set2 = set.Clone();

            for (int i = 0; i < 10000; i++)
            {
                if (set2 == set)
                {
                    set2 = set.Clone();
                }
            }

            Assert.AreEqual(nodes.Length, set2.Count);
            Assert.IsTrue(set2 == set);
        }

        /// <summary>
        /// This test is here to show the improvement that
        /// the CFGNodeSet yields over Set<CFGNode>.
        /// </summary>
        [Test]
        public void TestGenericSetClone()
        {
            CFG cfg = new CFG();

            Set<CFGNode> set = new Set<CFGNode>();

            CFGNode[] nodes = new CFGNode[65536];
            for (int i = 0; i < nodes.Length; i++)
            {
                nodes[i] = cfg.AddNode();
            }

            for (int i = 0; i < nodes.Length; i++)
            {
                set.Add(nodes[i]);
            }

            Set<CFGNode> set2 = set.Clone();

            for (int i = 0; i < 200; i++)
            {
                if (set2 == set)
                {
                    set2 = set.Clone();
                }
            }

            Assert.AreEqual(nodes.Length, set2.Count);
            Assert.IsTrue(set2 == set);
        }

        private static void Main(string[] args)
        {
            Tests tests = new Tests();
        }
    }

    #endregion

}
