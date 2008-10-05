using System;
using System.Threading;
using System.Browser.Dom;
using System.Diagnostics;
using System.Collections.Generic;

using XaeiOS;
using XaeiOS.Process;

namespace XaeiOS.ProcessViewer
{
    public class ProcessViewer
    {
        private IDomElement _processViewerArea;
        private IDomElement _mainTable;
        private IDomElement _sipTableBody;
        private IDomElement _threadTableBody;
        private IDomElement _lastUpdatedElement;
        private List<IDomElement> _sipRows = new List<IDomElement>();
        private List<IDomElement> _threadRows = new List<IDomElement>();

        public int UpdateInterval
        {
            get;
            set;
        }

        public ProcessViewer()
        {
            UpdateInterval = 500;
        }

        // TODO: The following code does not work at runtime.  Check XaeiO.Compiler2
        /**
         * 
         * 
        public void Start()
        {
            IDomElement processViewerElement = DomManager.Document.GetElementById("process-viewer-area");
            while (true)
            {
                Logging.Debug("Updating process viewer UI");

                // update the UI every 500 ms
                StringBuilder sb = new StringBuilder();

                BuildSIPTable(sb);
                BuildThreadTable(sb);
                processViewerElement.InnerHtml = sb.ToString();
                Thread.Sleep(500);
            }
        }
         * */

        public void Start()
        {
            Console.WriteLine("Process viewer building UI");
            BuildUI();
            while (true)
            {
                //Logging.Debug("Updating SIPs");
                UpdateSIPs();
                //Logging.Debug("Updating Threads");
                UpdateThreads();
                //Logging.Debug("Updating last updated element");
                _lastUpdatedElement.InnerHtml = "Last updated: " + new NativeDate().ToString();
                Thread.Sleep(UpdateInterval);
            }
        }
        private void BuildUI()
        {
            _processViewerArea = DomManager.Document.GetElementById("process-viewer-area");
            _mainTable = DomManager.CreateElement("table");
            _mainTable.SetAttribute("cellspacing", "2");
            _mainTable.SetAttribute("cellpadding", "2");

            IDomElement tr = DomManager.CreateElement("tr");
            tr.SetAttribute("valign", "top");

            IDomElement td = DomManager.CreateElement("td");
            IDomElement sipTableHeader = DomManager.CreateElement("span");
            sipTableHeader.InnerHtml = "Processes:<br />----------------------------------------<br />";
            td.AppendChild(sipTableHeader);
            IDomElement sipTable = BuildSIPTable();
            _sipTableBody = DomManager.CreateElement("tbody");
            sipTable.AppendChild(_sipTableBody);
            td.AppendChild(sipTable);
            tr.AppendChild(td);

            td = DomManager.CreateElement("td");
            IDomElement threadTableHeader = DomManager.CreateElement("span");
            threadTableHeader.InnerHtml = "Threads:<br />---------------------------------------------------------------<br />";
            td.AppendChild(threadTableHeader);
            IDomElement threadTable = BuildThreadTable();
            _threadTableBody = DomManager.CreateElement("tbody");
            threadTable.AppendChild(_threadTableBody);
            td.AppendChild(threadTable);
            tr.AppendChild(td);

            _mainTable.AppendChild(tr);

            _processViewerArea.AppendChild(DomManager.CreateElement("br"));

            _lastUpdatedElement = DomManager.CreateElement("span");
            _processViewerArea.AppendChild(_lastUpdatedElement);

            _processViewerArea.AppendChild(DomManager.CreateElement("br"));

            _processViewerArea.AppendChild(_mainTable);
        }
        private IDomElement BuildSIPTable()
        {
            IDomElement sipTable = DomManager.CreateElement("table");
            sipTable.InnerHtml = "<tr><td>ID</td><td>Name</td></tr>";
            return sipTable;
        }
        private IDomElement BuildThreadTable()
        {
            IDomElement threadTable = DomManager.CreateElement("table");
            threadTable.InnerHtml = "<tr><td>ID</td><td>Name</td><td>Process</td><td>Priority</td></tr>";
            return threadTable;
        }
        private void UpdateSIPs()
        {
            List<IDomElement> newSipRows = new List<IDomElement>();

            // build new sip rows
            SIP[] sips = SIP.GetSIPs();
            for (int i = 0; i < sips.Length; i++)
            {
                SIP sip = sips[i];
                IDomElement newSipRow = DomManager.CreateElement("tr");

                // id
                IDomElement td = DomManager.CreateElement("td");
                td.InnerHtml = sip.PID.ToString();
                newSipRow.AppendChild(td);

                // name
                td = DomManager.CreateElement("td");
                td.InnerHtml = sip.Name;
                newSipRow.AppendChild(td);

                newSipRows.Add(newSipRow);
            }

            // remove old sip rows
            for (int i = 0; i < _sipRows.Count; i++)
            {
                IDomElement sipRow = _sipRows[i];
                sipRow.ParentNode.RemoveChild(sipRow);
            }

            // add new sip rows
            for (int i = 0; i < newSipRows.Count; i++)
            {
                _sipTableBody.AppendChild(newSipRows[i]);
            }
            _sipRows = newSipRows;
        }
        private void UpdateThreads()
        {
            for (int i = 0; i < _threadRows.Count; i++)
            {
                IDomElement threadRow = _threadRows[i];
                threadRow.ParentNode.RemoveChild(threadRow);
            }
            _threadRows = new List<IDomElement>();

            Thread[] threads = Thread.GetThreads();
            for (int i = 0; i < threads.Length; i++)
            {
                Thread thread = threads[i];
                IDomElement newThreadRow = DomManager.CreateElement("tr");

                // id
                IDomElement td = DomManager.CreateElement("td");
                TaskHandle task = thread.Task;
                if (task != null)
                {
                    td.InnerHtml = task.ToString();
                }
                else
                {
                    td.InnerHtml = "?";
                }
                newThreadRow.AppendChild(td);

                // name
                td = DomManager.CreateElement("td");
                td.InnerHtml = thread.Name;
                newThreadRow.AppendChild(td);

                // process
                td = DomManager.CreateElement("td");
                SIP sip = thread.SIP;
                if (sip != null)
                {
                    td.InnerHtml = sip.ToString();
                }
                else
                {
                    td.InnerHtml = "?";
                }
                newThreadRow.AppendChild(td);

                /*
                // blocked
                // TODO: XaeiO.Compiler does not properly compile conditional expressions
                td = DomManager.CreateElement("td");
                if (thread.Blocked)
                {
                    td.InnerHtml = "Blocked";
                }
                else
                {
                    td.InnerHtml = "Running";
                }
                newThreadRow.AppendChild(td);*/

                // priority
                td = DomManager.CreateElement("td");
                td.InnerHtml = thread.Priority.ToString();
                newThreadRow.AppendChild(td);

                _threadRows.Add(newThreadRow);
                _threadTableBody.AppendChild(newThreadRow);
            }
        }
    }
}