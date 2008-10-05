using System;
using System.Collections.Generic;
using System.Text;

namespace Tenpow.Collections.Generic
{
    public static class CollectionHelper
    {
        public static void AddRange<T>(IList<T> list, IEnumerable<T> range)
        {
            foreach (T t in range)
            {
                list.Add(t);
            }
        }
    }
}
