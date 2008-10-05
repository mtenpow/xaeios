/* See license.txt for terms of usage */

var Firebug = null;
var FirebugContext = null;

(function() { with (XPCOMUtils) {

// ************************************************************************************************
// Constants

const nsIWebNavigation = CI("nsIWebNavigation");

const LOAD_FLAGS_BYPASS_PROXY = nsIWebNavigation.LOAD_FLAGS_BYPASS_PROXY;
const LOAD_FLAGS_BYPASS_CACHE = nsIWebNavigation.LOAD_FLAGS_BYPASS_CACHE;
const LOAD_FLAGS_NONE = nsIWebNavigation.LOAD_FLAGS_NONE;

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

const panelURL = "chrome://firebug/content/panel.html";

const statusCropSize = 20;

const positiveZoomFactors = [1, 1.1, 1.2, 1.3, 1.5, 2, 3];
const negativeZoomFactors = [1, 0.95, 0.8, 0.7, 0.5, 0.2, 0.1];

// ************************************************************************************************
// Globals

var panelBox, panelSplitter, sidePanelDeck, panelBar1, panelBar2, locationList, locationSeparator,
    panelStatus, panelStatusSeparator;

var waitingPanelBarCount = 2;

var externalMode = (window.location == "chrome://firebug/content/firebug.xul");
var externalBrowser = null;

var disabledBox = null;
var disabledHead = null;
var disabledCaption = null;
var enableSiteLink = null;
var enableSystemPagesLink = null;
var enableAlwaysLink = null;

// ************************************************************************************************

top.FirebugChrome =
{
    window: window,

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    // Initialization

    panelBarReady: function(panelBar)
    {
        try
        {
            // Wait until all panelBar bindings are ready before initializing
            if (--waitingPanelBarCount == 0)
                this.initialize();
        }
        catch (exc)
        {
            FBTrace.dumpProperties("chrome.panelBarReady FAILS", exc);
        }

    },

    initialize: function()
    {
    if (window.arguments)
          var detachArgs = window.arguments[0];

        if (!detachArgs)
            detachArgs = {};

        if (detachArgs.FBL)
            top.FBL = detachArgs.FBL;
        else
            FBL.initialize();

        if (detachArgs.Firebug)
            Firebug = detachArgs.Firebug;
        else
            Firebug.initialize();

        panelBox = $("fbPanelBox");
        panelSplitter = $("fbPanelSplitter");
        sidePanelDeck = $("fbSidePanelDeck");
        panelBar1 = $("fbPanelBar1");
        panelBar2 = $("fbPanelBar2");
        locationList = $("fbLocationList");
        locationSeparator = $("fbLocationSeparator");
        panelStatus = $("fbPanelStatus");
        panelStatusSeparator = $("fbStatusSeparator");

        var browser1 = panelBar1.browser;
        browser1.addEventListener("load", browser1Loaded, true);
        browser1.loadURI(panelURL);

        window.addEventListener("blur", onBlur, true);
    },

    /**
     * Called when the UI is ready to be initialized, once the panel browsers are loaded.
     */
    initializeUI: function()
    {
    try {
        if (window.arguments)
            var detachArgs = window.arguments[0];

        if (detachArgs)
        {
            FirebugContext = detachArgs.context ? detachArgs.context : FirebugContext;
            externalBrowser = detachArgs.browser;// else undefined
        }

        this.applyTextSize(Firebug.textSize);

        var doc1 = panelBar1.browser.contentDocument;
        disabledBox = doc1.getElementById("disabledBox");
        disabledHead = doc1.getElementById("disabledHead");
        disabledCaption = doc1.getElementById("disabledCaption");
        enableAlwaysLink = doc1.getElementById("enableAlwaysLink");
        enableSiteLink = doc1.getElementById("enableSiteLink");
        enableSystemPagesLink = doc1.getElementById("enableSystemPagesLink");

        doc1.addEventListener("mouseover", onPanelMouseOver, false);
        doc1.addEventListener("mouseout", onPanelMouseOut, false);
        doc1.addEventListener("mousedown", onPanelMouseDown, false);
        doc1.addEventListener("click", onPanelClick, false);
        panelBar1.addEventListener("selectingPanel", onSelectingPanel, false);

        var doc2 = panelBar2.browser.contentDocument;
        doc2.addEventListener("mouseover", onPanelMouseOver, false);
        doc2.addEventListener("mouseout", onPanelMouseOut, false);
        doc2.addEventListener("click", onPanelClick, false);
        doc2.addEventListener("mousedown", onPanelMouseDown, false);
        panelBar2.addEventListener("selectPanel", onSelectedSidePanel, false);

        locationList.addEventListener("selectObject", onSelectLocation, false);

        var win1 = panelBar1.browser.contentWindow;
        win1.enableAlways = bindFixed(Firebug.setPref, Firebug, "disabledAlways", false);
        win1.enableSite = bindFixed(Firebug.disableSite, Firebug, false);
        win1.enableSystemPages = bindFixed(Firebug.disableSystemPages, Firebug, false);

        for (var i = 0; i < Firebug.panelTypes.length; ++i)
        {
            var panelType = Firebug.panelTypes[i];
            if (!panelType.prototype.parentPanel)
                panelBar1.addTab(panelType);
        }

        if (externalMode)
            this.attachBrowser(externalBrowser, FirebugContext);
        else
            Firebug.initializeUI(detachArgs);
        } catch (exc) {
            FBTrace.dumpProperties("chrome.initializeUI fails", exc);
        }

    },

    shutdown: function()
    {
        var doc1 = panelBar1.browser.contentDocument;
        doc1.removeEventListener("mouseover", onPanelMouseOver, false);
        doc1.removeEventListener("mouseout", onPanelMouseOut, false);
        doc1.removeEventListener("mousedown", onPanelMouseDown, false);
        doc1.removeEventListener("click", onPanelClick, false);

        var doc2 = panelBar2.browser.contentDocument;
        doc2.removeEventListener("mouseover", onPanelMouseOver, false);
        doc2.removeEventListener("mouseout", onPanelMouseOut, false);
        doc2.removeEventListener("mousedown", onPanelMouseDown, false);
        doc2.removeEventListener("click", onPanelClick, false);

        locationList.removeEventListener("selectObject", onSelectLocation, false);

        window.removeEventListener("blur", onBlur, true);

        if (externalMode)
            this.detachBrowser(externalBrowser, FirebugContext);
        else
            Firebug.shutdown();

    },

    updateOption: function(name, value)
    {
        if (panelBar1.selectedPanel)
            panelBar1.selectedPanel.updateOption(name, value);
        if (panelBar2.selectedPanel)
            panelBar2.selectedPanel.updateOption(name, value);

        if (name == "textSize")
            this.applyTextSize(value);
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    attachBrowser: function(browser, context)  // XXXjjb context == (FirebugContext || null)  and externalMode == true
    {
        if (externalMode)
        {
            browser.detached = true;
            browser.originalChrome = browser.chrome;
            browser.chrome = this;
        }

        if (context)
        {
            if (externalMode)
                context.externalChrome = this;

            context.reattach(this);
        }

        if (context == FirebugContext)
        {
            Firebug.reattachContext(browser, context);

            this.syncPanel();

            if (!externalMode)
                Firebug.syncBar(true);
        }
    },

    detachBrowser: function(browser, context)
    {
        if (context)
        {
            delete context.externalChrome;
            delete context.detached;
        }

        browser.chrome = browser.originalChrome;
        delete browser.showFirebug;
        delete browser.detached;
        delete browser.originalChrome;

        if (browser && browser.chrome)
            browser.chrome.attachBrowser(browser, context);
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    getCurrentBrowser: function()
    {
        return externalBrowser ? externalBrowser : Firebug.tabBrowser.selectedBrowser
    },

    getCurrentURI: function()
    {
        try
        {
            if (externalBrowser)
                return externalBrowser.currentURI;
            else
                return Firebug.tabBrowser.currentURI;
        }
        catch (exc)
        {
            return null;
        }
    },

    getPanelDocument: function(panelType)
    {
        if (!panelType.prototype.parentPanel)
            return panelBar1.browser.contentDocument;
        else
            return panelBar2.browser.contentDocument;
    },

    getPanelBrowser: function(panel)
    {
        if (!panel.parentPanel)
            return panelBar1.browser;
        else
            return panelBar2.browser;
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    close: function()
    {
        window.close();
    },

    focus: function()
    {
        window.focus();
    },

    isFocused: function()
    {
        var winMediator = CCSV("@mozilla.org/appshell/window-mediator;1", "nsIWindowMediator");

        return winMediator.getMostRecentWindow(null) == window;
    },

    reload: function(skipCache)
    {
        var reloadFlags = skipCache
            ? LOAD_FLAGS_BYPASS_PROXY | LOAD_FLAGS_BYPASS_CACHE
            : LOAD_FLAGS_NONE;

        var browser = this.getCurrentBrowser();
        browser.webNavigation.reload(reloadFlags);
    },

    gotoPreviousTab: function()
    {
        if (FirebugContext.previousPanelName)
            this.selectPanel(FirebugContext.previousPanelName);
    },

    getNextObject: function(reverse)
    {
        var panel = FirebugContext.getPanel(FirebugContext.panelName);
        if (panel)
        {
            var item = panelStatus.getItemByObject(panel.selection);
            if (item)
            {
                if (reverse)
                    item = item.previousSibling ? item.previousSibling.previousSibling : null;
                else
                    item = item.nextSibling ? item.nextSibling.nextSibling : null;

                if (item)
                    return item.repObject;
            }
        }
    },

    gotoNextObject: function(reverse)
    {
        var nextObject = this.getNextObject(reverse);
        if (nextObject)
            this.select(nextObject);
        else
            beep();
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    // Panels

    navigate: function(object, panelName, sidePanelName)
    {
        var panel;
        if (panelName || sidePanelName)
            panel = this.selectPanel(panelName, sidePanelName);
        else
            panel = this.getSelectedPanel();

        if (panel)
            panel.navigate(object);
    },

    select: function(object, panelName, sidePanelName, forceUpdate)
    {
        var bestPanelName = getBestPanelName(object, FirebugContext, panelName);
        var panel = this.selectPanel(bestPanelName, sidePanelName, true);
        if (panel)
            panel.select(object, forceUpdate);
    },

    selectPanel: function(panelName, sidePanelName, noRefresh)
    {
        if (panelName && sidePanelName)
            FirebugContext.sidePanelNames[panelName] = sidePanelName;

        return panelBar1.selectPanel(panelName, false, noRefresh);
    },

    selectSidePanel: function(panelName)
    {
        return panelBar2.selectPanel(panelName);
    },

    clearPanels: function()
    {
        panelBar1.selectedPanel = null;
        panelBar2.selectedPanel = null;
    },

    getSelectedPanel: function()
    {
        return panelBar1.selectedPanel;
    },

    getSelectedSidePanel: function()
    {
        return panelBar2.selectedPanel;
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    // UI Synchronization

    showContext: function(browser, context)
    {
        if (!context || context != FirebugContext)
        {
            FirebugContext = context;

            if (externalBrowser || browser.showFirebug)
                this.syncPanel();
        }
    },

    showLoadedContext: function(context)
    {
        if (externalBrowser || context.browser.showFirebug)
            this.syncPanel();
    },

    hidePanel: function()
    {
        if (panelBar1.selectedPanel)
        {
            panelBar1.selectedPanel.visible = false;
            panelBar1.selectedPanel.hide();
        }

        if (panelBar2.selectedPanel)
        {
            panelBar2.selectedPanel.visible = false;
            panelBar2.selectedPanel.hide();
        }
    },

    syncPanel: function()
    {
        panelStatus.clear();

        if (FirebugContext)
        {
            var panelName = FirebugContext.panelName
                ? FirebugContext.panelName
                : Firebug.defaultPanelName;

            if (!panelName || !Firebug.getPanelType(panelName))
                panelName = "console";

            this.syncMainPanels();
            panelBar1.selectPanel(panelName, true);

            disabledBox.setAttribute("collapsed", "true");
        }
        else
        {
            var uri = this.getCurrentURI();
            if (uri)
            {
                var host = getURIHost(uri);
                var isSystemPage = FBL.isSystemURL(uri.spec);
                var caption;
                if (Firebug.disabledAlways)
                {
                    caption = FBL.$STR("DisabledHeader");
                    enableAlwaysLink.firstChild.nodeValue = FBL.$STR("EnableAlways");
                }
                enableSystemPagesLink.firstChild.nodeValue = "";
                enableSiteLink.firstChild.nodeValue ="";
                if (isSystemPage)
                {
                    caption = FBL.$STR("IsSystemPage");
                    enableSystemPagesLink.firstChild.nodeValue = FBL.$STR("EnableForSystemPages");
                }
                else if (!host)
                {
                    caption = FBL.$STR("DisabledForFiles");
                    enableSiteLink.firstChild.nodeValue = FBL.$STR("EnableForFiles");
                }
                else
                {
                    caption = FBL.$STRF("DisabledForSiteHeader", [host]);
                    enableSiteLink.firstChild.nodeValue = FBL.$STRF("EnableForSite", [host]);
                }

                disabledHead.firstChild.nodeValue = caption;
                disabledBox.removeAttribute("collapsed");
            }

            panelBar1.selectPanel(null, true);
        }

        if (externalBrowser)
            this.syncTitle();
    },

    syncMainPanels: function()
    {
        var panelTypes = Firebug.getMainPanelTypes(FirebugContext);
        panelBar1.updatePanels(panelTypes);
    },

    syncSidePanels: function()
    {
        var panelTypes = Firebug.getSidePanelTypes(FirebugContext, panelBar1.selectedPanel);
        panelBar2.updatePanels(panelTypes);

        if (FirebugContext)
        {
            var sidePanelName = FirebugContext.sidePanelNames[FirebugContext.panelName];
            sidePanelName = getBestSidePanelName(sidePanelName, panelTypes);
// FF3: if the next line is commented out, Fbug allows FF to paint page when HTML with DOMside panels are up, else not.
            panelBar2.selectPanel(sidePanelName);
        }
        else
            panelBar2.selectPanel(null);

        sidePanelDeck.selectedPanel = panelBar2;
        FBL.collapse(sidePanelDeck, !panelBar2.selectedPanel);
        FBL.collapse(panelSplitter, !panelBar2.selectedPanel);
    },

    syncTitle: function()
    {
        if (FirebugContext)
        {
            var win = FirebugContext.window;
            var title = win.document.title;
            if (!title)
                title = win.location.href;

            window.document.title = FBL.$STRF("WindowTitle", [title]);
        }
        else
            window.document.title = FBL.$STR("Firebug");
    },

    focusLocationList: function()
    {
        locationList.showPopup();
    },

    syncLocationList: function()
    {
        var panel = panelBar1.selectedPanel;
        if (panel && panel.location)
        {
            locationList.location = panel.location;
            FBL.collapse(locationSeparator, false);
            FBL.collapse(locationList, false);
        }
        else
        {
            FBL.collapse(locationSeparator, true);
            FBL.collapse(locationList, true);
        }
    },

    clearStatusPath: function()
    {
        panelStatus.clear();
    },

    syncStatusPath: function()
    {
        var panel = panelBar1.selectedPanel;
        if (!panel)
        {
            panelStatus.clear();
        }
        else
        {
            var path = panel.getObjectPath(panel.selection);
            if (!path || !path.length)
            {
                FBL.hide(panelStatusSeparator, true);
                panelStatus.clear();
            }
            else
            {
                FBL.hide(panelStatusSeparator, false);

                if (panel.name != panelStatus.lastPanelName)
                    panelStatus.clear();

                panelStatus.lastPanelName = panel.name;

                // If the object already exists in the list, just select it and keep the path
                var selection = panel.selection;
                var existingItem = panelStatus.getItemByObject(panel.selection);
                if (existingItem)
                    panelStatus.selectItem(existingItem);
                else
                {
                    panelStatus.clear();

                    for (var i = 0; i < path.length; ++i)
                    {
                        var object = path[i];

                        var rep = Firebug.getRep(object);
                        var objectTitle = rep.getTitle(object, FirebugContext);
                        var title = FBL.cropString(objectTitle, statusCropSize);
                        panelStatus.addItem(title, object, rep, panel.statusSeparator);
                    }

                    panelStatus.selectObject(panel.selection);
                }
            }
        }
    },

    toggleOrient: function()
    {
        panelSplitter.orient = panelBox.orient
            = panelBox.orient == "vertical" ? "horizontal" : "vertical";
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    addTab: function(context, url, title, parentPanel)
    {
        context.addPanelType(url, title, parentPanel);
        if (context == FirebugContext)
        {
            if (parentPanel)
            {
                var currentPanel = this.getSelectedPanel();
                if (currentPanel && parentPanel == currentPanel.name)
                    this.syncSidePanels();
            }
            else
            {
                this.syncMainPanels();
            }
        }
    },

    removeTab: function(context, url)
    {
        context.removePanelType(url);
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    getGlobalAttribute: function(id, name)
    {
        var elt = $(id);
        return elt.getAttribute(name);
    },

    setGlobalAttribute: function(id, name, value)
    {
        var elt = $(id);
        if (elt)
            elt.setAttribute(name, value);

        if (externalMode && FirebugContext && FirebugContext.originalChrome)
            FirebugContext.originalChrome.setGlobalAttribute(id, name, value);
    },

    keyCodeListen: function(key, filter, listener, capture)
    {
        if (!filter)
            filter = FBL.noKeyModifiers;

        var keyCode = KeyEvent["DOM_VK_"+key];

        function fn(event)
        {
            if (event.keyCode == keyCode && (!filter || filter(event)))
            {
                listener();
                FBL.cancelEvent(event);
            }
        }

        window.addEventListener("keypress", fn, capture);

        return [fn, capture];
    },

    keyListen: function(ch, filter, listener, capture)
    {
        if (!filter)
            filter = FBL.noKeyModifiers;

        var charCode = ch.charCodeAt(0);

        function fn(event)
        {
            if (event.charCode == charCode && (!filter || filter(event)))
            {
                listener();
                FBL.cancelEvent(event);
            }
        }

        window.addEventListener("keypress", fn, capture);

        return [fn, capture];
    },

    keyIgnore: function(listener)
    {
        window.removeEventListener("keypress", listener[0], listener[1]);
    },

    $: function(id)
    {
        return $(id);
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    applyTextSize: function(value)
    {
        var zoom = value >= 0 ? positiveZoomFactors[value] : negativeZoomFactors[Math.abs(value)];

        panelBar1.browser.markupDocumentViewer.textZoom = zoom;
        panelBar2.browser.markupDocumentViewer.textZoom = zoom;
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    // UI Event Listeners

    onPanelNavigate: function(object, panel)
    {
        this.syncLocationList();
    },

    onPanelSelect: function(object, panel)
    {
        if (panel == panelBar1.selectedPanel)
        {
            this.syncStatusPath();

            var sidePanel = panelBar2.selectedPanel;
            if (sidePanel)
                sidePanel.select(object);
        }
    },

    onOptionsShowing: function(popup)
    {
        for (var child = popup.firstChild; child; child = child.nextSibling)
        {
            if (child.localName == "menuitem")
            {
                var option = child.getAttribute("option");
                if (option)
                {
                    var checked = false;
                    if (option == "disabledForSite")
                    {
                        var uri = this.getCurrentURI();
                        if (uri)
                        {
                            if (FBL.isSystemURL(uri.spec))
                            {
                                checked = !Firebug.allowSystemPages;
                                child.setAttribute("label", FBL.$STR("DisableForSystemPages"));
                            }
                            else if (!getURIHost(uri))
                            {
                                checked = Firebug.disabledFile;
                                child.setAttribute("label", FBL.$STR("DisableForFiles"));
                            }
                            else
                            {
                                checked = Firebug.isURIDenied(uri);
                                child.setAttribute("label",
                                    FBL.$STRF("DisableForSite", [uri.host]));
                            }
                        }
                    }
                    else if (option == "profiling")
                        checked = fbs.profiling;
                    else
                        checked = Firebug.getPref(option);

                    child.setAttribute("checked", checked);
                }
            }
        }
    },

    onToggleOption: function(menuitem)
    {
        var option = menuitem.getAttribute("option");
        var checked = menuitem.getAttribute("checked") == "true";

        if (option == "disabledForSite")
            Firebug.disableSite(checked);
        else
            Firebug.setPref(option, checked);
    },

    onContextShowing: function(event)
    {
        if (!panelBar1.selectedPanel)
            return false;

        var popup = $("fbContextMenu");
        var target = document.popupNode;
        var panel = target ? Firebug.getElementPanel(target) : null;

        if (!panel)
            return false;

        FBL.eraseNode(popup);

        if (!this.contextMenuObject && !$("cmd_copy").getAttribute("disabled"))
        {
            var menuitem = FBL.createMenuItem(popup, {label: "Copy"});
            menuitem.setAttribute("command", "cmd_copy");
        }

        var object;
        if (this.contextMenuObject)
            object = this.contextMenuObject;
        else if (target && target.ownerDocument == document)
            object = Firebug.getRepObject(target);
        else if (target)
            object = panel.getPopupObject(target);

        this.contextMenuObject = null;

        var rep = Firebug.getRep(object);
        var realObject = rep ? rep.getRealObject(object, FirebugContext) : null;
        var realRep = realObject ? Firebug.getRep(realObject) : null;

        if (realObject && realRep)
        {
            // 1. Add the custom menu items from the realRep
            var menu = realRep.getContextMenuItems(realObject, target, FirebugContext);
            if (menu)
            {
                for (var i = 0; i < menu.length; ++i)
                    FBL.createMenuItem(popup, menu[i]);
            }
        }

        if (object && rep && rep != realRep)
        {
            // 1. Add the custom menu items from the original rep
            var items = rep.getContextMenuItems(object, target, FirebugContext);
            if (items)
            {
                for (var i = 0; i < items.length; ++i)
                    FBL.createMenuItem(popup, items[i]);
            }
        }

        // 1. Add the custom menu items from the panel
        if (panel)
        {
            var items = panel.getContextMenuItems(realObject, target);
            if (items)
            {
                for (var i = 0; i < items.length; ++i)
                    FBL.createMenuItem(popup, items[i]);
            }
        }

        // 2. Add the inspect menu items
        if (realObject && rep && rep.inspectable)
        {
            var separator = null;

            var items = this.getInspectMenuItems(realObject);
            for (var i = 0; i < items.length; ++i)
            {
                if (popup.firstChild && !separator)
                    separator = FBL.createMenuSeparator(popup);

                FBL.createMenuItem(popup, items[i]);
            }
        }

        if (!popup.firstChild)
            return false;
    },

    onEditorsShowing: function(popup)
    {
        var editors = Firebug.registeredEditors;
        if ( editors.length > 0 )
        {
            var lastChild = popup.lastChild;
            FBL.eraseNode(popup);
            var disabled = (!FirebugContext);
            for( var i = 0; i < editors.length; ++i )
            {
                if (editors[i] == "-")
                {
                    FBL.createMenuItem(popup, "-");
                    continue;
                }
                var item = {label: editors[i].label, image: editors[i].image,
                                nol10n: true, disabled: disabled };
                var menuitem = FBL.createMenuItem(popup, item);
                menuitem.setAttribute("command", "cmd_openInEditor");
                menuitem.value = editors[i].id;
            }
            FBL.createMenuItem(popup, "-");
            popup.appendChild(lastChild);
        }
    },

    getInspectMenuItems: function(object)
    {
        var items = [];

        for (var i = 0; i < Firebug.panelTypes.length; ++i)
        {
            var panelType = Firebug.panelTypes[i];
            if (!panelType.prototype.parentPanel
                && panelType.prototype.name != FirebugContext.panelName
                && panelSupportsObject(panelType, object))
            {
                var panelName = panelType.prototype.name;

                var title = panelType.prototype.title
                    ? panelType.prototype.title
                    : FBL.$STR("Panel-"+panelName);
                var label = FBL.$STRF("InspectInTab", [title]);

                var command = bindFixed(this.select, this, object, panelName);
                items.push({label: label, command: command, nol10n: true});
            }
        }

        return items;
    },

    onTooltipShowing: function(event)
    {
        if (!panelBar1.selectedPanel)
            return false;

        var tooltip = $("fbTooltip");
        var target = document.tooltipNode;

        var panel = target ? Firebug.getElementPanel(target) : null;

        var object;
        if (target.ownerDocument == document)
            object = Firebug.getRepObject(target);
        else if (panel)
            object = panel.getTooltipObject(target);

        var rep = object ? Firebug.getRep(object) : null;
        object = rep ? rep.getRealObject(object, FirebugContext) : null;
        rep = object ? Firebug.getRep(object) : null;

        if (object && rep)
        {
            var label = rep.getTooltip(object);
            if (label)
            {
                tooltip.setAttribute("label", label);
                return true;
            }
        }

        if (target.hasAttribute("title"))
        {
            tooltip.setAttribute("label", target.getAttribute("title"));
            return true;
        }

        return false;
    },

    openAboutDialog: function()
    {
        var extensionManager = CCSV("@mozilla.org/extensions/manager;1", "nsIExtensionManager");
        openDialog("chrome://mozapps/content/extensions/about.xul", "",
            "chrome,centerscreen,modal", "urn:mozilla:item:firebug@software.joehewitt.com", extensionManager.datasource);
    }
};

// ************************************************************************************************
// Local Helpers

function panelSupportsObject(panelType, object)
{
    if (panelType)
    {
        try {
            // This tends to throw exceptions often because some objects are weird
            return panelType.prototype.supportsObject(object)
        } catch (exc) {}
    }

    return 0;
}

function getBestPanelName(object, context, panelName)
{
    if (!panelName)
        panelName = context.panelName;

    // Check if the suggested panel name supports the object, and if so, go with it
    if (panelName)
    {
        panelType = Firebug.getPanelType(panelName);
        if (panelSupportsObject(panelType, object))
            return panelType.prototype.name;
    }

    // The suggested name didn't pan out, so search for the panel type with the
    // most specific level of support

    var bestLevel = 0;
    var bestPanel = null;

    for (var i = 0; i < Firebug.panelTypes.length; ++i)
    {
        var panelType = Firebug.panelTypes[i];
        if (!panelType.prototype.parentPanel)
        {
            var level = panelSupportsObject(panelType, object);
            if (!bestLevel || (level && (level > bestLevel) ))
            {
                bestLevel = level;
                bestPanel = panelType;
            }
        }
    }

    return bestPanel ? bestPanel.prototype.name : null;
}

function getBestSidePanelName(sidePanelName, panelTypes)
{
    if (sidePanelName)
    {
        // Verify that the suggested panel name is in the acceptable list
        for (var i = 0; i < panelTypes.length; ++i)
        {
            if (panelTypes[i].prototype.name == sidePanelName)
                return sidePanelName;
        }
    }

    // Default to the first panel type in the list
    return panelTypes.length ? panelTypes[0].prototype.name : null;
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// Event listeners

function browser1Loaded()
{
    var browser1 = panelBar1.browser;
    browser1.removeEventListener("load", browser1Loaded, true);

    var browser2 = panelBar2.browser;
    browser2.addEventListener("load", browser2Loaded, true);
    browser2.loadURI(panelURL);
}

function browser2Loaded()
{
    var browser2 = panelBar2.browser;
    browser2.removeEventListener("load", browser2Loaded, true);

    FirebugChrome.initializeUI();
}

function onBlur(event)
{
    Firebug.Inspector.highlightObject(null, FirebugContext);
}

function onSelectLocation(event)
{
    var location = locationList.repObject;
    FirebugChrome.navigate(location);
}

function onSelectingPanel(event)
{
    var panel = panelBar1.selectedPanel;
    var panelName = panel ? panel.name : null;

    if (FirebugContext)
    {
        FirebugContext.previousPanelName = FirebugContext.panelName;
        FirebugContext.panelName = panelName;

        FirebugContext.sidePanelName =
            FirebugContext.sidePanelNames && panelName in FirebugContext.sidePanelNames
            ? FirebugContext.sidePanelNames[panelName]
            : null;
    }

    FirebugChrome.syncLocationList();
    FirebugChrome.syncStatusPath();
    FirebugChrome.syncSidePanels();

    var browser = panel ? panel.context.browser : FirebugChrome.getCurrentBrowser();
    Firebug.showPanel(browser, panel);
}

function onSelectedSidePanel(event)
{
    var sidePanel = panelBar2.selectedPanel;
    if (FirebugContext)
    {
        var panelName = FirebugContext.panelName;
        var sidePanelName = sidePanel ? sidePanel.name : null;
        FirebugContext.sidePanelNames[panelName] = sidePanelName;
    }

    var panel = panelBar1.selectedPanel;
    if (panel && sidePanel)
        sidePanel.select(panel.selection);

    var browser = sidePanel ? sidePanel.context.browser : FirebugChrome.getCurrentBrowser();
    Firebug.showSidePanel(browser, sidePanel);
}

function onPanelMouseOver(event)
{
    var object = Firebug.getRepObject(event.target);
    if (object)
    {
        var realObject = getRealObject(object);
        if (realObject)
            Firebug.Inspector.highlightObject(realObject, FirebugContext);
    }
}

function onPanelMouseOut(event)
{
    Firebug.Inspector.highlightObject(null);
}

function onPanelClick(event)
{
    var repNode = Firebug.getRepNode(event.target);
    if (repNode)
    {
        var object = repNode.repObject;
        var rep = Firebug.getRep(object);
        var realObject = rep ? rep.getRealObject(object, FirebugContext) : null;
        var realRep = realObject ? Firebug.getRep(realObject) : rep;
        if (!realObject)
            realObject = object;

        if (FBL.isLeftClick(event))
        {
            if (FBL.hasClass(repNode, "objectLink"))
            {
                if (realRep)
                {
                    realRep.inspectObject(realObject, FirebugContext);
                    FBL.cancelEvent(event);
                }
            }
        }
        else if (FBL.isControlClick(event) || FBL.isMiddleClick(event))
        {
            if (!realRep || !realRep.browseObject(realObject, FirebugContext))
            {
                if (rep && !(rep != realRep && rep.browseObject(object, FirebugContext)))
                {
                    var panel = Firebug.getElementPanel(event.target);
                    if (!panel || !panel.browseObject(realObject))
                        return;
                }
            }
            FBL.cancelEvent(event);
        }
    }
}

function onPanelMouseDown(event)
{
    if (FBL.isLeftClick(event))
    {
        var editable = FBL.getAncestorByClass(event.target, "editable");
        if (editable)
        {
            Firebug.Editor.startEditing(editable);
            FBL.cancelEvent(event);
        }
    }
    else if (FBL.isMiddleClick(event) && Firebug.getRepNode(event.target))
    {
        // Prevent auto-scroll when middle-clicking a rep object
        FBL.cancelEvent(event);
    }
}

function getRealObject(object)
{
    var rep = Firebug.getRep(object);
    var realObject = rep ? rep.getRealObject(object, FirebugContext) : null;
    var realRep = realObject ? Firebug.getRep(realObject) : rep;
    return realObject ? realObject : object;
}

function getURIHost(uri)
{
    try
    {
        return uri.host;
    }
    catch (exc)
    {
        return "";
    }
}

// ************************************************************************************************
// Utils (duplicated from lib.js)

function $(id, doc)
{
    if (doc)
        return doc.getElementById(id);
    else
        return document.getElementById(id);
}

function cloneArray(array, fn)
{
   var newArray = [];

   for (var i = 0; i < array.length; ++i)
       newArray.push(array[i]);

   return newArray;
}

function bindFixed()
{
    var args = cloneArray(arguments), fn = args.shift(), object = args.shift();
    return function() { return fn.apply(object, args); }
}

}})();

// ************************************************************************************************

// XXXjoe This horrible hack works around a focus bug in Firefox which is caused when
// the HTML Validator extension and Firebug are installed.  It causes the keyboard to
// behave erratically when typing, and the only solution I've found is to delay
// the initialization of HTML Validator by overriding this function with a timeout.
if (top.TidyBrowser)
{
    var prev = TidyBrowser.prototype.updateStatusBar;
    TidyBrowser.prototype.updateStatusBar = function()
    {
        var self = this, args = arguments;
        setTimeout(function()
        {
            prev.apply(self, args);
        });
    }
}

// ************************************************************************************************

function ddd(text)
{
    const consoleService = Components.classes["@mozilla.org/consoleservice;1"].
        getService(Components.interfaces["nsIConsoleService"]);
    consoleService.logStringMessage(text + "");
}

function dddx()
{
    Firebug.Console.logFormatted(arguments);
}


