using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Security.Principal;

using Queue = System.Collections.Queue;

namespace System.Net.Comet
{
    internal class CometClient
    {
        private CometRequestHandler _requestHandler;
        private Queue _queue;
        private EventWaitHandle _queueNotEmpty;
        private object _lock = new object();

        public string CometId
        {
            get
            {
                return _requestHandler.CometId;
            }
        }

        public IPrincipal User
        {
            get
            {
                return _requestHandler.User;
            }
        }

        public CometClient(CometRequestHandler requestHandler)
        {
            _requestHandler = requestHandler;
            _queue = System.Collections.Queue.Synchronized(new Queue());
            _queueNotEmpty = new EventWaitHandle(false, EventResetMode.ManualReset);
        }

        public string Path
        {
            get
            {
                return _requestHandler.Path;
            }
        }

        public void Enqueue(string s)
        {
            Console.WriteLine("Enqueueing {0} at client {1}", s, this);
            lock (_lock)
            {
                _queue.Enqueue(s);
                _queueNotEmpty.Set();
            }
            FlushQueue();
        }

        public void FlushQueue()
        {
            Console.WriteLine("Flushing queue for client: {0}", _requestHandler.CometId);
            bool empty;
            lock (_lock)
            {
                empty = _queue.Count == 0;
            }
            if (empty)
            {
                Console.WriteLine("Queue is empty...waiting");
                _queueNotEmpty.WaitOne(); // wait until queue is no longer empty
            }
            Console.WriteLine("Queue is not empty flushing...");
            //requestHandler.WriteOKResponse();
            StringBuilder sb = new StringBuilder();
            lock (_lock)
            {
                foreach (string s in _queue)
                {
                    sb.Append(s);
                }
                try
                {
                    _requestHandler.Write(sb.ToString());
                }
                finally
                {
                    _queue.Clear();
                    _queueNotEmpty.Reset();
                }
            }
            _requestHandler.Flush();
        }

        public override string ToString()
        {
            if (_requestHandler.User != null)
            {
                return _requestHandler.CometId + ": " + _requestHandler.User.ToString() + " - @" + Path;
            }
            else
            {
                return _requestHandler.CometId + ": @" + Path;
            }
        }
    }
}