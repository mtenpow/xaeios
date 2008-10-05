using System;
using System.Threading;
using System.Diagnostics;
using System.Collections.Generic;

namespace XaeiOS.DataStructures
{
    internal class DoublyLinkedList<T>
    {
        public DoublyLinkedListItem<T> Head
        {
            get
            {
                return _head;
            }
        }
        private DoublyLinkedListItem<T> _head;
        private DoublyLinkedListItem<T> _tail;
        private Dictionary<T, DoublyLinkedListItem<T>> _cache;
        private Lock _lock;

        public int Count
        {
            get
            {
                _lock.Acquire();
                int count = _count;
                _lock.Release();
                return count;
            }
        }
        private int _count;

        public DoublyLinkedList()
        {
            _count = 0;
            _head = _tail = null;
            _lock = new Lock();
            _cache = new Dictionary<T, DoublyLinkedListItem<T>>();
        }

        public void Add(T item)
        {
            _lock.Acquire();
            try
            {
                if (_head == null)
                {
                    DoublyLinkedListItem<T> i = new DoublyLinkedListItem<T>();
                    i.Data = item;
                    _head = _tail = i;
                    _cache[item] = i;
                }
                else
                {
                    DoublyLinkedListItem<T> i = new DoublyLinkedListItem<T>();
                    i.Data = item;
                    _tail.Next = i;
                    i.Previous = _tail;
                    _tail = i;
                    _cache[item] = i;
                }
                _count++;
                //Logging.Trace(item + " added to linked list.  Now have " + _count + " items.");
            }
            finally
            {
                _lock.Release();
            }
        }

        public void Remove(T item)
        {
            if (item == null)
            {
                throw new ArgumentException("item cannot be null");
            }
            Debug.Assert("Tried to remove null item from DoublyLinkedList", item != null);
            _lock.Acquire();
            if (!_cache.ContainsKey(item))
            {
                _lock.Release();
                throw new ArgumentException("item is not in the list");
            }

            DoublyLinkedListItem<T> current = _cache[item];
            //Logging.Trace(current.Data + " equals " + item + ".  Removing item from doubly linked list.");
            // this is the item, remove it
            DoublyLinkedListItem<T> previous = current.Previous;
            DoublyLinkedListItem<T> next = current.Next;
            if (previous == null)
            {
                // this must be the head
                _head = next;
            }
            else
            {
                previous.Next = next;
            }
            if (next == null)
            {
                // this must be the tail
                _tail = previous;
            }
            else
            {
                next.Previous = previous;
            }
            _count--;
            //Logging.Trace("Doubly linked list now has " + _count + " items.");
            _cache.Remove(item);
            _lock.Release();
            return;
        }
    }

    internal class DoublyLinkedListItem<T>
    {
        public T Data;
        public DoublyLinkedListItem<T> Previous;
        public DoublyLinkedListItem<T> Next;
    }
}