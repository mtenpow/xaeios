/* See license.txt for terms of usage */

FBL.ns(function() { with (FBL) {

// ************************************************************************************************
// Constants

const nsIWebNavigation = CI("nsIWebNavigation");
const nsIWebProgressListener = CI("nsIWebProgressListener");
const nsIWebProgress = CI("nsIWebProgress");
const nsISupportsWeakReference = CI("nsISupportsWeakReference");
const nsISupports = CI("nsISupports");
const nsIURI = CI("nsIURI");

const NOTIFY_STATE_DOCUMENT = nsIWebProgress.NOTIFY_STATE_DOCUMENT;

const STATE_IS_WINDOW = nsIWebProgressListener.STATE_IS_WINDOW;
const STATE_IS_DOCUMENT = nsIWebProgressListener.STATE_IS_DOCUMENT;
const STATE_IS_REQUEST = nsIWebProgressListener.STATE_IS_REQUEST;

const STATE_START = nsIWebProgressListener.STATE_START;
const STATE_STOP = nsIWebProgressListener.STATE_STOP;
const STATE_TRANSFERRING = nsIWebProgressListener.STATE_TRANSFERRING;

const STOP_ALL = nsIWebNavigation.STOP_ALL;

const dummyURI = "about:layout-dummy-request";
const aboutBlank = "about:blank";

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

const tabBrowser = $("content");

// ************************************************************************************************
// Globals

var contexts = [];
var listeners = [];

// ************************************************************************************************

top.TabWatcher =
{
    initialize: function(owner)
    {
        // Store contexts where they can be accessed externally
        this.contexts = contexts;

        this.owner = owner;  // Firebug object
        this.addListener(owner);

        if (tabBrowser)
            tabBrowser.addProgressListener(TabProgressListener, NOTIFY_STATE_DOCUMENT);
    },

    destroy: function()
    {
        if (tabBrowser)
        {
            tabBrowser.removeProgressListener(TabProgressListener);

            for (var i = 0; i < tabBrowser.browsers.length; ++i)
            {
                var browser = tabBrowser.browsers[i];
                this.unwatchTopWindow(browser.contentWindow);
            }
        }

        this.removeListener(this.owner);
        this.owner = null;
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    activate: function()
    {
        if (tabBrowser)
            this.watchBrowser(tabBrowser.selectedBrowser);
    },

    deactivate: function()
    {
        if (tabBrowser)
        {
            var currentSelected = false;
            for (var i = 0; i < tabBrowser.browsers.length; ++i)
            {
                var browser = tabBrowser.browsers[i];
                if (!this.owner.isURIAllowed(safeGetURI(browser)))
                {
                    this.unwatchTopWindow(browser.contentWindow);

                    if (browser == tabBrowser.selectedBrowser)
                        currentSelected = true;
                }
            }
            return currentSelected;
        }
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    /**
     * Attaches to a top-level window. Creates context unless we just re-activated on an existing context
     */
    watchTopWindow: function(win, uri)
    {
        if (tabBrowser.selectedBrowser.cancelNextLoad)
        {
            // We need to cancel this load and try again after a delay... this is used
            // mainly to prevent chaos while when the debugger is active when a page
            // is unloaded
            delete tabBrowser.selectedBrowser.cancelNextLoad;
            tabBrowser.selectedBrowser.webNavigation.stop(STOP_ALL);
            delayBrowserLoad(tabBrowser.selectedBrowser, win.location.href);
            return;
        }

        var context = this.getContextByWindow(win);
        if (!context)
        {
            if (!this.owner.enableContext(win,uri))
            {
                return this.watchContext(win, null);
            }
        }

        if (!context)
        {
            var browser = this.getBrowserByWindow(win);
            if (!fbs.countContext(true))
                return;

            // If the page is reloaded, store the persisted state from the previous
            // page on the new context
            var persistedState = browser.persistedState;
            delete browser.persistedState;
            if (!persistedState || persistedState.location != win.location.href)
                persistedState = null;

            context = this.owner.createTabContext(win, browser, browser.chrome, persistedState);
            contexts.push(context);

            this.dispatch("initContext", [context]);

            win.addEventListener("pagehide", onUnloadTopWindow, true);
            win.addEventListener("pageshow", onLoadWindowContent, true);
            win.addEventListener("DOMContentLoaded", onLoadWindowContent, true);
        }
        // XXXjjb at this point we either have context or we just pushed null into contexts and sent it to init...

        // This is one of two places that loaded is set. The other is in watchLoadedTopWindow
        if (context)
            context.loaded = !context.browser.webProgress.isLoadingDocument;

        this.watchContext(win, context);
    },

    /**
     * Called once the document within a tab is completely loaded.
     */
    watchLoadedTopWindow: function(win)
    {
        var isSystem = isSystemPage(win);

        var context = this.getContextByWindow(win);
        if ((context && !context.window) || (isSystem && !Firebug.allowSystemPages))
        {
            this.unwatchTopWindow(win);
            this.watchContext(win, null, isSystem);
            return;
        }

        if (context && !context.loaded)
        {
            context.loaded = true;
            this.dispatch("loadedContext", [context]);
        }
    },

    /**
     * Attaches to a window that may be either top-level or a frame within the page.
     */
    watchWindow: function(win, context)
    {
        if (!context)
            context = this.getContextByWindow(getRootWindow(win));

        // Unfortunately, dummy requests that trigger the call to watchWindow
        // are called several times, so we have to avoid dispatching watchWindow
        // more than once
        var href = win.location.href;
        if (context && context.windows.indexOf(win) == -1 && href != aboutBlank)
        {
            context.windows.push(win);

            var eventType = (win.parent == win) ? "pagehide" : "unload";
            win.addEventListener(eventType, onUnloadWindow, false);
            this.dispatch("watchWindow", [context, win]);
        }
    },

    /**
     * Detaches from a top-level window. Destroys context
     */
    unwatchTopWindow: function(win)
    {
        var context = this.getContextByWindow(win);
        this.unwatchContext(win, context);
    },

    /**
     * Detaches from a window, top-level or not.
     */
    unwatchWindow: function(win)
    {
        var context = this.getContextByWindow(win);

        var index = context ? context.windows.indexOf(win) : -1;
        if (index != -1)
        {
            context.windows.splice(index, 1);
            this.dispatch("unwatchWindow", [context, win]);  // XXXjjb Joe check
        }
    },

    /**
     * Attaches to the window inside a browser because of user-activation
     */
    watchBrowser: function(browser)
    {
        this.watchTopWindow(browser.contentWindow, safeGetURI(browser));
    },

    unwatchBrowser: function(browser)
    {
        this.unwatchTopWindow(browser.contentWindow);
    },

    watchContext: function(win, context, isSystem)
    {
        var browser = context ? context.browser : this.getBrowserByWindow(win);
        if (browser)
            browser.isSystemPage = isSystem;

        this.dispatch("showContext", [browser, context]);
    },

    unwatchContext: function(win, context)
    {
        if (!context)
        {
            var browser = this.getBrowserByWindow(win);
            this.owner.destroyTabContext(browser, null);
            return;
        }

        var persistedState = {location: context.window.location.href};
        context.browser.persistedState = persistedState;

        iterateWindows(context.window, function(win)
        {
            TabWatcher.dispatch("unwatchWindow", [context, win]);
        });

        this.dispatch("destroyContext", [context, persistedState]);

        if (this.cancelNextLoad)
        {
            delete this.cancelNextLoad;
            context.browser.cancelNextLoad = true;
        }

        try
        {
            context.window.removeEventListener("pagehide", onUnloadTopWindow, true);
        }
        catch (exc)
        {
        }

        fbs.countContext(false);

        this.owner.destroyTabContext(context.browser, context);
        context.destroy(persistedState);

        remove(contexts, context);
        for (var p in context)
            delete context[p];
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    getContextByWindow: function(win)
    {
        while (win && win.parent != win)
            win = win.parent;

        if (!win) // eg search bar, and sometimes win.parent is null??
            return;

        for (var i = 0; i < contexts.length; ++i)
        {
            var context = contexts[i];
            if (context.window == win)
                return context;
        }
    },

    getBrowserByWindow: function(win)
    {
        for (var i = 0; i < tabBrowser.browsers.length; ++i)
        {
            var browser = tabBrowser.browsers[i];
            if (browser.contentWindow == win)
            {
                if (!browser.chrome)
                {
                    browser.chrome = FirebugChrome;
                    browser.addProgressListener(FrameProgressListener, NOTIFY_STATE_DOCUMENT);
                }
                return browser;
            }
        }

        return null;
    },

    iterateContexts: function(fn)
    {
        for (var i = 0; i < contexts.length; ++i)
            fn(contexts[i]);
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    addListener: function(listener)
    {
        listeners.push(listener);
    },

    removeListener: function(listener)
    {
        remove(listeners, listener);
    },

    dispatch: function(name, args)
    {
        for (var i = 0; i < listeners.length; ++i)
        {
            var listener = listeners[i];
            if (name in listener)
            {
                try
                {
                    listener[name].apply(listener, args);
                }
                catch (exc)
                {
                    ERROR(exc);
                }
            }
        }
    }
};

// ************************************************************************************************

var BaseProgressListener =
{
    QueryInterface : function(iid)
    {
        if (iid.equals(nsIWebProgressListener) ||
            iid.equals(nsISupportsWeakReference) ||
            iid.equals(nsISupports))
        {
            return this;
        }

        throw Components.results.NS_NOINTERFACE;
    },

    stateIsRequest: false,
    onLocationChange: function() {},
    onStateChange : function() {},
    onProgressChange : function() {},
    onStatusChange : function() {},
    onSecurityChange : function() {},
    onLinkIconAvailable : function() {}
};

// ************************************************************************************************

var TabProgressListener = extend(BaseProgressListener,
{
    onLocationChange: function(progress, request, uri)
    {
        // Only watch windows that are their own parent - e.g. not frames
        if (progress.DOMWindow.parent == progress.DOMWindow)
        {
            TabWatcher.watchTopWindow(progress.DOMWindow, uri);
        }
    },

    onStateChange: function(progress, request, flag, status)
    {
        /*if (flag & STATE_STOP)
        {
            var win = progress.DOMWindow;
            if (win && win.parent == win)
                TabWatcher.watchLoadedTopWindow(progress.DOMWindow);
        }*/
    }
});

// ************************************************************************************************

var FrameProgressListener = extend(BaseProgressListener,
{
    onStateChange: function(progress, request, flag, status)
    {
        if (flag & STATE_IS_REQUEST && flag & STATE_START)
        {
            // We need to get the hook in as soon as the new DOMWindow is created, but before
            // it starts executing any scripts in the page.  After lengthy analysis, it seems
            // that the start of these "dummy" requests is the only state that works.

            var safeName = safeGetName(request);
            if (safeName && ((safeName == dummyURI) || safeName == "about:document-onload-blocker") )
            {
                var win = progress.DOMWindow;
                // Another weird edge case here - when opening a new tab with about:blank,
                // "unload" is dispatched to the document, but onLocationChange is not called
                // again, so we have to call watchTopWindow here
                //if (win.parent == win && win.location.href == "about:blank")
                //    TabWatcher.watchTopWindow(win, win.location);
                // XXXms check this
                if (win.parent == win && (win.location.href == "about:blank" ))//  || safeName == "about:document-onload-blocker"))
                {
                    TabWatcher.watchTopWindow(win, win.location.href);
                    return;  // new one under our thumb
                }
            }
        }

        // Later I discovered that XHTML documents don't dispatch the dummy requests, so this
        // is our best shot here at hooking them.
        if (flag & STATE_IS_DOCUMENT && flag & STATE_TRANSFERRING)
        {
            TabWatcher.watchWindow(progress.DOMWindow);
            return;
        }

    }
});

// ************************************************************************************************
// Local Helpers


function onUnloadTopWindow(event)
{
    TabWatcher.unwatchTopWindow(event.currentTarget);
}

function onLoadWindowContent(event)
{
    var win = event.currentTarget;
    try
    {
        win.removeEventListener("pageshow", onLoadWindowContent, true);
    }
    catch (exc) {}

    try
    {
        win.removeEventListener("DOMContentLoaded", onLoadWindowContent, true);
    }
    catch (exc) {}

    // Signal that we got the onLoadWindowContent event. This prevents the FrameProgressListener from sending it.
    var context = TabWatcher.getContextByWindow(win);
    if (context)
        context.onLoadWindowContent = true;

    // Calling this after a timeout because I'm finding some cases where calling
    // it here causes freezeup when this results in loading a script file. This fixes that.
    setTimeout(function()
    {
        try
        {
            TabWatcher.watchLoadedTopWindow(win);
        }
        catch(exc)
        {
            ERROR(exc);
        }

    });
}

function onUnloadWindow(event)
{
    var win = event.currentTarget;
    var eventType = (win.parent == win) ? "pagehide" : "unload";
    win.removeEventListener(eventType, onUnloadWindow, false);
    TabWatcher.unwatchWindow(win);
}

function delayBrowserLoad(browser, uri)
{
    setTimeout(function() { browser.loadURI(uri); }, 100);
}

function safeGetName(request)
{
    try
    {
        return request.name;
    }
    catch (exc)
    {
        return null;
    }
}

function safeGetURI(browser)
{
    try
    {
        return browser.currentURI;
    }
    catch (exc)
    {
        return null;
    }
}

function getStateDescription(flag) {
    var state = "";
    if (flag & nsIWebProgressListener.STATE_START) state += "STATE_START ";
    else if (flag & nsIWebProgressListener.STATE_REDIRECTING) state += "STATE_REDIRECTING ";
    else if (flag & nsIWebProgressListener.STATE_TRANSFERRING) state += "STATE_TRANSFERRING ";
    else if (flag & nsIWebProgressListener.STATE_NEGOTIATING) state += "STATE_NEGOTIATING ";
    else if (flag & nsIWebProgressListener.STATE_STOP) state += "STATE_STOP ";

    if (flag & nsIWebProgressListener.STATE_IS_REQUEST) state += "STATE_IS_REQUEST ";
    if (flag & nsIWebProgressListener.STATE_IS_DOCUMENT) state += "STATE_IS_DOCUMENT ";
    if (flag & nsIWebProgressListener.STATE_IS_NETWORK) state += "STATE_IS_NETWORK ";
    if (flag & nsIWebProgressListener.STATE_IS_WINDOW) state += "STATE_IS_WINDOW ";
    if (flag & nsIWebProgressListener.STATE_RESTORING) state += "STATE_RESTORING ";
    if (flag & nsIWebProgressListener.STATE_IS_INSECURE) state += "STATE_IS_INSECURE ";
    if (flag & nsIWebProgressListener.STATE_IS_BROKEN) state += "STATE_IS_BROKEN ";
    if (flag & nsIWebProgressListener.STATE_IS_SECURE) state += "STATE_IS_SECURE ";
    if (flag & nsIWebProgressListener.STATE_SECURE_HIGH) state += "STATE_SECURE_HIGH ";
    if (flag & nsIWebProgressListener.STATE_SECURE_MED) state += "STATE_SECURE_MED ";
    if (flag & nsIWebProgressListener.STATE_SECURE_LOW) state += "STATE_SECURE_LOW ";

    return state;
}

// ************************************************************************************************

}});
