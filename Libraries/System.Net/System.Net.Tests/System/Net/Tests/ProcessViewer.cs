using System;
using System.Threading;
using System.Browser.Dom;
using System.Text;
using System.Diagnostics;
using XaeiOS.Process;

namespace System.Net.Tests
{
    public class ProcessViewer
    {
        public ProcessViewer()
        {
        }

        public void Start()
        {
            while (true)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("<table cellspacing=2 cellpading=2><tr valign=top><td>");
                BuildSIPTable(sb);
                sb.Append("</td><td>");
                BuildThreadTable(sb);
                sb.Append("</td></tr></table>");
                sb.Append("<br />Last updated: " + new NativeDate().ToString());
                UpdateInnerHTML(sb);
                Thread.Sleep(250);
            }
        }
        private void UpdateInnerHTML(StringBuilder sb)
        {
            IDomElement processViewerElement = DomManager.Document.GetElementById("process-viewer-area");
            processViewerElement.InnerHtml = sb.ToString();
            processViewerElement = null;
        }
        private void BuildSIPTable(StringBuilder sb)
        {
            sb.Append("SIP Table:<br />");
            sb.Append("----------------------------------------<br />");
            sb.Append("<table>");
            {
                sb.Append("<tr>");
                {
                    sb.Append("<td>");
                    {
                        sb.Append("PID");
                    }
                    sb.Append("</td>");

                    sb.Append("<td>");
                    {
                        sb.Append("Name");
                    }
                    sb.Append("</td>");
                }
                sb.Append("</tr>");

                SIP[] sips = SIP.GetSIPs();
                for (int i = 0; i < sips.Length; i++)
                {
                    SIP sip = sips[i];
                    sb.Append("<tr>");
                    {
                        sb.Append("<td>");
                        {
                            sb.Append(sip.ID.ToString());
                        }
                        sb.Append("</td>");

                        sb.Append("<td>");
                        {
                            sb.Append(sip.Name);
                        }
                        sb.Append("</td>");
                    }
                    sb.Append("</tr>");
                }
            }
            sb.Append("</table>");
        }
        private void BuildThreadTable(StringBuilder sb)
        {
            sb.Append("Thread Table:<br />");
            sb.Append("----------------------------------------<br />");
            sb.Append("<table>");
            {
                sb.Append("<tr>");
                {
                    sb.Append("<td>");
                    {
                        sb.Append("ID");
                    }
                    sb.Append("</td>");

                    sb.Append("<td>");
                    {
                        sb.Append("Name");
                    }
                    sb.Append("</td>");

                    sb.Append("<td>");
                    {
                        sb.Append("SIP");
                    }
                    sb.Append("</td>");

                    sb.Append("<td>");
                    {
                        sb.Append("Blocked?");
                    }
                    sb.Append("</td>");

                    sb.Append("<td>");
                    {
                        sb.Append("Priority");
                    }
                    sb.Append("</td>");
                }
                sb.Append("</tr>");

                Thread[] threads = Thread.GetThreads();
                for (int i = 0; i < threads.Length; i++)
                {
                    Thread thread = threads[i];
                    sb.Append("<tr>");
                    {
                        sb.Append("<td>");
                        {
                            sb.Append(thread.Task.ID.ToString());
                        }
                        sb.Append("</td>");

                        sb.Append("<td>");
                        {
                            sb.Append(thread.Name);
                        }
                        sb.Append("</td>");

                        sb.Append("<td>");
                        {
                            sb.Append(thread.SIP.Name);
                        }
                        sb.Append("</td>");

                        sb.Append("<td>");
                        {
                            sb.Append(thread.Blocked.ToString());
                        }
                        sb.Append("</td>");

                        sb.Append("<td>");
                        {
                            sb.Append(thread.Priority.ToString());
                        }
                        sb.Append("</td>");
                    }
                    sb.Append("</tr>");
                }
            }
            sb.Append("</table>");
        }
    }
}