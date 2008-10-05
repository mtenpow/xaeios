using System;
using System.Threading;
using System.Browser.XmlHttpRequest;

namespace XaeiOS.TestSuite.Tests
{
    public class XmlHttpRequestTest : TestBase
    {

        public override void PerformTest()
        {
            string url = "http://www.tenpow.com/";
            Log("Retrieving " + url + " via XmlHttpRequest");
            XmlHttpRequest xhr = XmlHttpRequestManager.DoSimpleXmlHttpRequest(url);
            //Log(xhr.ResponseText); // TODO: html encode

            try
            {
                int timeout = 1;
                url = "http://www.deviantart.com/";
                Log("Retrieving " + url + " using a timeout value of " + timeout + " milliseconds.  An exception will most likely be thrown.");
                xhr = XmlHttpRequestManager.DoSimpleXmlHttpRequest(url, RequestMethod.Get, null, null, null, timeout);
                //Log(xhr.ResponseText);
            }
            catch (XmlHttpRequestTimeoutException e)
            {
                Log("The request timed out as expected: " + xhr);
            }
        }

        public XmlHttpRequestTest()
            : base("XmlHttpRequest test")
        {
        }
    }
}