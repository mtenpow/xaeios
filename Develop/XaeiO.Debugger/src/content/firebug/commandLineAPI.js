/* See license.txt for terms of usage */

function FirebugCommandLineAPI(context)
{
    var baseWindow = context.window;

    this.$ = function(id)
    {
        var doc = baseWindow.document;
        return baseWindow.document.getElementById(id);
    };

    this.$$ = function(selector)
    {
        return FBL.getElementsBySelector(baseWindow.document, selector);
    };

    this.$x = function(xpath)
    {
        return FBL.getElementsByXPath(baseWindow.document, xpath);
    };

    this.cd = function(object)
    {
        if (object instanceof Window)
            baseWindow = context.baseWindow = object;
        else
            throw "Object must be a window.";
    };

    this.dir = function(o)
    {
        Firebug.Console.log(o, context, "dir", Firebug.DOMPanel.DirTable);
    };

    this.dirxml = function(o)
    {
        if (o instanceof Window)
            o = o.document.documentElement;
        else if (o instanceof Document)
            o = o.documentElement;

        Firebug.Console.log(o, context, "dirxml", Firebug.HTMLPanel.SoloElement);
    };

    this.clear = function()
    {
        Firebug.Console.clear(context);
    };

    this.inspect = function(obj, panelName)
    {
        context.chrome.select(obj, panelName);
    };

    this.keys = function(o)
    {
        return FBL.keys(o);
    };

    this.values = function(o)
    {
        return FBL.values(o);
    };

    this.debug = function(fn)
    {
        Firebug.Debugger.trace(fn, null, "debug");
    };

    this.undebug = function(fn)
    {
        Firebug.Debugger.untrace(fn, null, "debug");
    };

    this.monitor = function(fn)
    {
        Firebug.Debugger.trace(fn, null, "monitor");
    };

    this.unmonitor = function(fn)
    {
        Firebug.Debugger.untrace(fn, null, "monitor");
    };

    this.monitorEvents = function(object, types)
    {
        monitorEvents(object, types, context);
    };

    this.unmonitorEvents = function(object, types)
    {
        unmonitorEvents(object, types, context);
    };

    this.profile = function(title)
    {
        Firebug.Profiler.startProfiling(context, title);
    };

    this.profileEnd = function()
    {
        Firebug.Profiler.stopProfiling(context);
    };

    this.copy = function(x)
    {
        FBL.copyToClipboard(x);
    };
}
