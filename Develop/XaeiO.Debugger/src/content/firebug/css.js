/* See license.txt for terms of usage */

FBL.ns(function() { with (FBL) {

// ************************************************************************************************
// Constants

const nsIDOMCSSStyleRule = CI("nsIDOMCSSStyleRule");
const nsIInterfaceRequestor = CI("nsIInterfaceRequestor");
const nsISelectionDisplay = CI("nsISelectionDisplay");
const nsISelectionController = CI("nsISelectionController");

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

var domUtils = null;
try {
    domUtils = CCSV("@mozilla.org/inspector/dom-utils;1", "inIDOMUtils");
} catch (exc) {
    // We can try to live without "dom-utils", since it only comes with DOM Inspector
}

var CSSPropTag =
    DIV({class: "cssProp editGroup", $disabledStyle: "$prop.disabled"},
        SPAN({class: "cssPropName editable"}, "$prop.name"),
        SPAN({class: "cssColon"}, ":"),
        SPAN({class: "cssPropValue editable"}, "$prop.value$prop.important"),
        SPAN({class: "cssSemi"}, ";")
    );

var CSSRuleTag =
    TAG("$rule.tag", {rule: "$rule"});

var CSSImportRuleTag =
    DIV({class: "cssRule insertInto", _repObject: "$rule.rule"},
        "@import &quot;",
        A({class: "objectLink", _repObject: "$rule.rule.styleSheet"}, "$rule.rule.href"),
        "&quot;;"
    );

var CSSStyleRuleTag =
    DIV({class: "cssRule insertInto", _repObject: "$rule.rule.style",
            "ruleId": "$rule.id"},
        DIV({class: "cssHead"},
            SPAN({class: "cssSelector"}, "$rule.selector"), " {"
        ),
        FOR("prop", "$rule.props",
            CSSPropTag
        ),
        DIV({class: "editable insertBefore"}, "}")
    );

const reSplitCSS =  /(url\("?[^"\)]+?"?\))|(rgb\(.*?\))|(#[\dA-Fa-f]+)|(-?\d+(\.\d+)?(%|[a-z]{1,2})?)|([^,\s]+)|"(.*?)"/;

const reURL = /url\("?([^"\)]+)?"?\)/;

const reRepeat = /no-repeat|repeat-x|repeat-y|repeat/;

const sothinkInstalled = !!$("swfcatcherKey_sidebar");
const styleGroups =
{
    text: [
        "font-family",
        "font-size",
        "font-weight",
        "font-style",
        "color",
        "text-transform",
        "text-decoration",
        "letter-spacing",
        "word-spacing",
        "line-height",
        "text-align",
        "vertical-align",
        "direction",
        "column-count",
        "column-gap",
        "column-width"
    ],

    background: [
        "background-color",
        "background-image",
        "background-repeat",
        "background-position",
        "background-attachment",
        "opacity"
    ],

    box: [
        "width",
        "height",
        "top",
        "right",
        "bottom",
        "left",
        "margin-top",
        "margin-right",
        "margin-bottom",
        "margin-left",
        "padding-top",
        "padding-right",
        "padding-bottom",
        "padding-left",
        "border-top-width",
        "border-right-width",
        "border-bottom-width",
        "border-left-width",
        "border-top-color",
        "border-right-color",
        "border-bottom-color",
        "border-left-color",
        "border-top-style",
        "border-right-style",
        "border-bottom-style",
        "border-left-style",
        "-moz-border-top-radius",
        "-moz-border-right-radius",
        "-moz-border-bottom-radius",
        "-moz-border-left-radius",
        "outline-top-width",
        "outline-right-width",
        "outline-bottom-width",
        "outline-left-width",
        "outline-top-color",
        "outline-right-color",
        "outline-bottom-color",
        "outline-left-color",
        "outline-top-style",
        "outline-right-style",
        "outline-bottom-style",
        "outline-left-style"
    ],

    layout: [
        "position",
        "display",
        "visibility",
        "z-index",
        "overflow",
        "white-space",
        "clip",
        "float",
        "clear",
        "-moz-box-sizing"
    ],

    other: [
        "cursor",
        "list-style-image",
        "list-style-position",
        "list-style-type",
        "marker-offset",
        "user-focus",
        "user-select",
        "user-modify",
        "user-input"
    ]
};

// ************************************************************************************************

function CSSStyleSheetPanel() {}

CSSStyleSheetPanel.prototype = extend(Firebug.SourceBoxPanel,
{
    template: domplate(
    {
        tag:
            FOR("rule", "$rules",
                CSSRuleTag
            )
    }),

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    refresh: function()
    {
        if (this.location)
            this.updateLocation(this.location);
        else if (this.selection)
            this.updateSelection(this.selection);
    },

    toggleEditing: function()
    {
        if (!this.stylesheetEditor)
            this.stylesheetEditor = new StyleSheetEditor(this.document);

        if (this.editing)
            Firebug.Editor.stopEditing();
        else
        {
			if (!this.location)
				return;

            var styleSheet = this.location.editStyleSheet
                ? this.location.editStyleSheet.sheet
                : this.location;

            var css = getStyleSheetCSS(styleSheet, this.context);
            //var topmost = getTopmostRuleLine(this.panelNode);

            this.stylesheetEditor.styleSheet = this.location;
            Firebug.Editor.startEditing(this.panelNode, css, this.stylesheetEditor);
            //this.stylesheetEditor.scrollToLine(topmost.line, topmost.offset);
        }
    },

    getStylesheetURL: function(style)
    {
        return this.location.href;
    },

    getRuleByLine: function(styleSheet, line)
    {
        if (!domUtils)
            return null;

        var cssRules = styleSheet.cssRules;
        for (var i = 0; i < cssRules.length; ++i)
        {
            var rule = cssRules[i];
            if (rule instanceof CSSStyleRule)
            {
                var ruleLine = domUtils.getRuleLine(rule);
                if (ruleLine >= line)
                    return rule;
            }
        }
    },

    highlightRule: function(rule)
    {
        var ruleElement = Firebug.getElementByRepObject(this.panelNode, rule.style);
        if (ruleElement)
        {
            scrollIntoCenterView(ruleElement, this.panelNode);
            setClassTimed(ruleElement, "jumpHighlight", this.context);
        }
    },

    getStyleSheetRules: function(context, styleSheet)
    {
        function appendRules(cssRules)
        {
            for (var i = 0; i < cssRules.length; ++i)
            {
                var rule = cssRules[i];
                if (rule instanceof CSSStyleRule)
                {
                    var props = this.getRuleProperties(context, rule);
                    var line = domUtils.getRuleLine(rule);
                    var ruleId = rule.selectorText+"/"+line;
                    rules.push({tag: CSSStyleRuleTag, rule: rule, id: ruleId,
                                selector: rule.selectorText, props: props});
                }
                else if (rule instanceof CSSImportRule)
                    rules.push({tag: CSSImportRuleTag, rule: rule});
                else if (rule instanceof CSSMediaRule)
                    appendRules.apply(this, [rule.cssRules]);
            }
        }

        var rules = [];
        appendRules.apply(this, [styleSheet.cssRules]);
        return rules;
    },

    getRuleProperties: function(context, rule, inheritMode)
    {
        var props = [];

        var ruleRE = /\{(.*?)\}$/;
        var m = ruleRE.exec(rule.cssText);
        if (!m)
            return props;

        var propRE = /\s*([^:\s]*?)\s*:\s*(.*?)\s*(! important)?$/;

        var lines = m[1].split(";");
        for (var i = 0; i < lines.length-1; ++i)
        {
            var m = propRE.exec(lines[i]);
            if (!m)
                continue;

            var name = m[1], value = m[2], important = !!m[3];
            if (value)
                this.addProperty(name, value, important, false, inheritMode, props);
        }

        var line = domUtils.getRuleLine(rule);
        var ruleId = rule.selectorText+"/"+line;
        this.addOldProperties(context, ruleId, inheritMode, props);
        sortProperties(props);

        return props;
    },

    addOldProperties: function(context, ruleId, inheritMode, props)
    {
        if (context.selectorMap && ruleId in context.selectorMap)
        {
            var moreProps = context.selectorMap[ruleId];
            for (var i = 0; i < moreProps.length; ++i)
            {
                var prop = moreProps[i];
                this.addProperty(prop.name, prop.value, prop.important, true, inheritMode, props);
            }
        }
    },

    addProperty: function(name, value, important, disabled, inheritMode, props)
    {
        if (inheritMode && !inheritedStyleNames[name])
            return;

        name = this.translateName(name, value);
        if (name)
        {
            value = rgbToHex(value);
            important = important ? " !important" : "";

            var prop = {name: name, value: value, important: important, disabled: disabled};
            props.push(prop);
        }
    },

    translateName: function(name, value)
    {
        // Don't show these proprietary Mozilla properties
        if ((value == "-moz-initial"
            && (name == "-moz-background-clip" || name == "-moz-background-origin"
                || name == "-moz-background-inline-policy"))
        || (value == "physical"
            && (name == "margin-left-ltr-source" || name == "margin-left-rtl-source"
                || name == "margin-right-ltr-source" || name == "margin-right-rtl-source"))
        || (value == "physical"
            && (name == "padding-left-ltr-source" || name == "padding-left-rtl-source"
                || name == "padding-right-ltr-source" || name == "padding-right-rtl-source")))
            return null;

        // Translate these back to the form the user probably expects
        if (name == "margin-left-value")
            return "margin-left";
        else if (name == "margin-right-value")
            return "margin-right";
        else if (name == "margin-top-value")
            return "margin-top";
        else if (name == "margin-bottom-value")
            return "margin-bottom";
        else if (name == "padding-left-value")
            return "padding-left";
        else if (name == "padding-right-value")
            return "padding-right";
        else if (name == "padding-top-value")
            return "padding-top";
        else if (name == "padding-bottom-value")
            return "padding-bottom";
        // XXXjoe What about border!
        else
            return name;
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    editElementStyle: function()
    {
        var elementStyle = this.selection.style;
        var rulesBox = this.panelNode.firstChild;
        var styleRuleBox = Firebug.getElementByRepObject(rulesBox, elementStyle);
        if (styleRuleBox)
            Firebug.Editor.insertRowForObject(styleRuleBox);
        else
        {
            var rule = {rule: this.selection, inherited: false, selector: "element.style", props: []};
            var styleRuleBox = this.template.ruleTag.replace({rule: rule}, this.document);

            if (rulesBox.firstChild)
                rulesBox.insertBefore(styleRuleBox, rulesBox.firstChild);
            else
                rulesBox.appendChild(styleRuleBox);

            Firebug.Editor.insertRowForObject(styleRuleBox);
        }
    },

    insertPropertyRow: function(row)
    {
        Firebug.Editor.insertRowForObject(row);
    },

    editPropertyRow: function(row)
    {
        var propValueBox = getChildByClass(row, "cssPropValue");
        Firebug.Editor.startEditing(propValueBox);
    },

    deletePropertyRow: function(row)
    {
        var style = Firebug.getRepObject(row);
        var propName = getChildByClass(row, "cssPropName").textContent;
        style.removeProperty(propName);

        // Remove the property from the selector map, if it was disabled
        var ruleId = Firebug.getRepNode(row).getAttribute("ruleId");
        if (ruleId in this.context.selectorMap)
        {
            var map = this.context.selectorMap[ruleId];
            for (var i = 0; i < map.length; ++i)
            {
                if (map[i].name == propName)
                {
                    map.splice(i, 1);
                    break;
                }
            }
        }

        row.parentNode.removeChild(row);

        this.markChange(this.name == "stylesheet");
    },

    disablePropertyRow: function(row)
    {
        toggleClass(row, "disabledStyle");

        var style = Firebug.getRepObject(row);
        var propName = getChildByClass(row, "cssPropName").textContent;

        if (!this.context.selectorMap)
            this.context.selectorMap = {};

        // XXXjoe Generate unique key for elements too
        var ruleId = Firebug.getRepNode(row).getAttribute("ruleId");
        if (!(ruleId in this.context.selectorMap))
            this.context.selectorMap[ruleId] = [];

        var map = this.context.selectorMap[ruleId];
        var propValue = getChildByClass(row, "cssPropValue").textContent;
        var parsedValue = parsePriority(propValue);

        if (hasClass(row, "disabledStyle"))
        {
            style.removeProperty(propName);

            map.push({"name": propName, "value": parsedValue.value,
                "important": parsedValue.priority});
        }
        else
        {
            style.setProperty(propName, parsedValue.value, parsedValue.priority);

            var index = findPropByName(map, propName);
            map.splice(index, 1);
        }

        this.markChange(this.name == "stylesheet");
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    onMouseDown: function(event)
    {
        // XXjoe Hack to only allow clicking on the checkbox
        if (!isLeftClick(event) || event.clientX > 20)
            return;

        if (hasClass(event.target, "textEditor"))
            return;

        var row = getAncestorByClass(event.target, "cssProp");
        if (row)
        {
            this.disablePropertyRow(row);
            cancelEvent(event);
        }
    },

    onClick: function(event)
    {
        if (!isLeftClick(event) || event.clientX <= 20 || event.detail != 2)
            return;

        var row = getAncestorByClass(event.target, "cssRule");
        if (row && !getAncestorByClass(event.target, "cssPropName")
            && !getAncestorByClass(event.target, "cssPropValue"))
        {
            this.insertPropertyRow(row);
            cancelEvent(event);
        }
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    // extends Panel

    name: "stylesheet",
    parentPanel: null,
    searchable: true,
    dependents: ["css", "stylesheet", "dom", "domSide", "layout"],

    initialize: function()
    {
        this.onMouseDown = bind(this.onMouseDown, this);
        this.onClick = bind(this.onClick, this);

        Firebug.Panel.initialize.apply(this, arguments);
        this.initializeSourceBoxes();

    },

    destroy: function(state)
    {
        state.scrollTop = this.panelNode.scrollTop ? this.panelNode.scrollTop : this.lastScrollTop;

        persistObjects(this, state);

        Firebug.Panel.destroy.apply(this, arguments);
    },

    initializeNode: function(oldPanelNode)
    {
        this.panelNode.addEventListener("mousedown", this.onMouseDown, false);
        this.panelNode.addEventListener("click", this.onClick, false);
    },

    destroyNode: function()
    {
        this.panelNode.removeEventListener("mousedown", this.onMouseDown, false);
        this.panelNode.removeEventListener("click", this.onClick, false);
    },

    show: function(state)
    {
        if (this.context.loaded && !this.location)
        {
            restoreObjects(this, state);

            if (state && state.scrollTop)
                this.panelNode.scrollTop = state.scrollTop;
        }
    },

    hide: function()
    {
        this.lastScrollTop = this.panelNode.scrollTop;
    },

    supportsObject: function(object)
    {
        if (object instanceof CSSStyleSheet)
            return 1;
        else if (object instanceof CSSStyleRule)
            return 2;
        else if (object instanceof SourceLink && object.type == "css" && reCSS.test(object.href))
            return 2;
        else
            return 0;
    },

    updateLocation: function(styleSheet)
    {
        if (styleSheet.editStyleSheet)
            styleSheet = styleSheet.editStyleSheet.sheet;

        var rules = this.getStyleSheetRules(this.context, styleSheet);
        if (rules.length)
            this.template.tag.replace({rules: rules}, this.panelNode);
        else
            FirebugReps.Warning.tag.replace({object: "EmptyStyleSheet"}, this.panelNode);
    },

    updateSelection: function(object)
    {
        this.selection = null;

        if (object instanceof CSSStyleRule)
        {
            this.navigate(object.parentStyleSheet);
            this.highlightRule(object);
        }
        else if (object instanceof CSSStyleSheet)
        {
            this.navigate(object);
        }
        else if (object instanceof SourceLink)
        {
            try
            {
                clearNode(this.panelNode);  // replace rendered stylesheets
                this.showSourceFile(object, function(sourceLink, sourceBox)
                {
                    if (sourceBox.sourceRow)
                        sourceBox.sourceRow.removeAttribute("exeLine");

                    var lineNo = sourceLink.line;
                    if (lineNo)
                    {
                        sourceBox.sourceRow = sourceBox.childNodes[lineNo-1];
                        if (sourceBox.sourceRow)
                        {
                            sourceBox.sourceRow.setAttribute("exeLine", "true");
                            scrollIntoCenterView(sourceBox.sourceRow, sourceBox);  // I don't know why this does not work.
                        }
                    }
                });
            }
            catch(exc) {
                FBTrace.dumpProperties("css.upDateSelection FAILS", exc);
            }
        }
    },

    getLocationList: function()
    {
        var styleSheets = [];

        function addSheet(sheet)
        {
            if (isSystemURL(sheet.href))
                return;

            styleSheets.push(sheet);

            for (var i = 0; i < sheet.cssRules.length; ++i)
            {
                var rule = sheet.cssRules[i];
                if (rule instanceof CSSImportRule)
                    addSheet(rule.styleSheet);
            }
        }

        var rootSheets = this.context.window.document.styleSheets;
        for (var i = 0; i < rootSheets.length; ++i)
            addSheet(rootSheets[i]);

        return styleSheets;
    },

    getOptionsMenuItems: function()
    {
        return [
            {label: "Refresh", command: bind(this.refresh, this) }
        ];
    },

    getContextMenuItems: function(style, target)
    {
        var items = [];

        if (this.infoTipType == "color")
        {
            items.push(
                {label: "CopyColor",
                    command: bindFixed(copyToClipboard, FBL, this.infoTipObject) }
            );
        }
        else if (this.infoTipType == "image")
        {
            items.push(
                {label: "CopyImageLocation",
                    command: bindFixed(copyToClipboard, FBL, this.infoTipObject) },
                {label: "OpenImageInNewTab",
                    command: bindFixed(openNewTab, FBL, this.infoTipObject) }
            );
        }

        if (this.selection instanceof Element)
        {
            items.push(
                "-",
                {label: "EditStyle",
                    command: bindFixed(this.editElementStyle, this) }
            );
        }

        if (getAncestorByClass(target, "cssRule"))
        {
            items.push(
                "-",
                {label: "NewProp",
                    command: bindFixed(this.insertPropertyRow, this, target) }
            );

            var propRow = getAncestorByClass(target, "cssProp");
            if (propRow)
            {
                var propName = getChildByClass(propRow, "cssPropName").textContent;
                var isDisabled = hasClass(propRow, "disabledStyle");

                items.push(
                    {label: $STRF("EditProp", [propName]), nol10n: true,
                        command: bindFixed(this.editPropertyRow, this, propRow) },
                    {label: $STRF("DeleteProp", [propName]), nol10n: true,
                        command: bindFixed(this.deletePropertyRow, this, propRow) },
                    {label: $STRF("DisableProp", [propName]), nol10n: true,
                        type: "checkbox", checked: isDisabled,
                        command: bindFixed(this.disablePropertyRow, this, propRow) }
                );
            }
        }

        items.push(
            "-",
            {label: "Refresh", command: bind(this.refresh, this) }
        );

        return items;
    },

    browseObject: function(object)
    {
        if (this.infoTipType == "image")
        {
            openNewTab(this.infoTipObject);
            return true;
        }
    },

    showInfoTip: function(infoTip, target, x, y)
    {
        var propValue = getAncestorByClass(target, "cssPropValue");
        if (propValue)
        {
            var offset = getClientOffset(propValue);
            var offsetX = x-offset.x;

            var text = propValue.textContent;
            var charWidth = propValue.offsetWidth/text.length;
            var charOffset = Math.floor(offsetX/charWidth);

            var cssValue = parseCSSValue(text, charOffset);
            if (cssValue)
            {
                if (cssValue.value == this.infoTipValue)
                    return true;

                this.infoTipValue = cssValue.value;

                if (cssValue.type == "rgb" || (!cssValue.type && isColorKeyword(cssValue.value)))
                {
                    this.infoTipType = "color";
                    this.infoTipObject = cssValue.value;

                    return Firebug.InfoTip.populateColorInfoTip(infoTip, cssValue.value);
                }
                else if (cssValue.type == "url")
                {
                    var style = Firebug.getRepObject(target);
                    var baseURL = this.getStylesheetURL(style);
                    var relURL = parseURLValue(cssValue.value);
                    var absURL = absoluteURL(relURL, baseURL);
                    var repeat = parseRepeatValue(text);

                    this.infoTipType = "image";
                    this.infoTipObject = absURL;

                    return Firebug.InfoTip.populateImageInfoTip(infoTip, absURL, repeat);
                }
            }
        }

        delete this.infoTipType;
        delete this.infoTipValue;
        delete this.infoTipObject;
    },

    getEditor: function(target, value)
    {
        if (!this.editor)
            this.editor = new CSSEditor(this.document);

        return this.editor;
    },

    getDefaultLocation: function()
    {
        if (!this.context.loaded)
            return null;

        var styleSheets = this.context.window.document.styleSheets;
        if (styleSheets.length)
        {
            var sheet = styleSheets[0];
            return isSystemURL(sheet.href) ? null : sheet;
        }
    },

    getObjectLocation: function(styleSheet)
    {
        return styleSheet.href;
    },

    search: function(text)
    {
        if (!text)
        {
            delete this.currentSearch;
            return false;
        }

        var row;
        if (this.currentSearch && text == this.currentSearch.text)
        {
            row = this.currentSearch.findNext(true);
        }
        else
        {
            if (this.editing)
            {
                this.currentSearch = new TextSearch(this.stylesheetEditor.box);
                row = this.currentSearch.find(text);

                if (row)
                {
                    var sel = this.document.defaultView.getSelection();
                    sel.removeAllRanges();
                    sel.addRange(this.currentSearch.range);
                    scrollSelectionIntoView(this);
                    return true;
                }
                else
                    return false;
            }
            else
            {
                function findRow(node) { return node.nodeType == 1 ? node : node.parentNode; }
                this.currentSearch = new TextSearch(this.panelNode, findRow);
                row = this.currentSearch.find(text);
            }
        }

        if (row)
        {
            this.document.defaultView.getSelection().selectAllChildren(row);
            scrollIntoCenterView(row, this.panelNode);
            return true;
        }
        else
            return false;
    }
});

// ************************************************************************************************

function CSSElementPanel() {}

CSSElementPanel.prototype = extend(CSSStyleSheetPanel.prototype,
{
    template: domplate(
    {
        cascadedTag:
            DIV({},
                FOR("rule", "$rules",
                    TAG("$ruleTag", {rule: "$rule"})
                ),
                FOR("section", "$inherited",
                    H1({class: "cssInheritHeader groupHeader"},
                        SPAN({class: "cssInheritLabel"}, "$inheritLabel"),
                        TAG(FirebugReps.Element.shortTag, {object: "$section.element"})
                    ),
                    FOR("rule", "$section.rules",
                        TAG("$ruleTag", {rule: "$rule"})
                    )
                )
            ),

        ruleTag:
            DIV({class: "cssRule insertInto", $cssInheritedRule: "$rule.inherited",
                 _repObject: "$rule.rule.style", "ruleId": "$rule.id"},
                DIV({class: "cssHead"},
                    SPAN({class: "cssSelector"}, "$rule.selector"), " {",
                    TAG(FirebugReps.SourceLink.tag, {object: "$rule.sourceLink"})
                ),
                FOR("prop", "$rule.props",
                    DIV({class: "cssProp editGroup", $disabledStyle: "$prop.disabled",
                            $cssOverridden: "$prop.overridden"},
                        SPAN({class: "cssPropName editable"}, "$prop.name"),
                        SPAN({class: "cssColon"}, ":"),
                        SPAN({class: "cssPropValue editable"}, "$prop.value$prop.important"),
                        SPAN({class: "cssSemi"}, ";")
                    )
                ),
                DIV({class: "editable insertBefore"}, "}")
            ),

        computedTag:
            DIV({},
                FOR("group", "$groups",
                    H1({class: "cssInheritHeader groupHeader"},
                        SPAN({class: "cssInheritLabel"}, "$group.title")
                    ),
                    TABLE({width: "100%"},
                        FOR("prop", "$group.props",
                            TR(
                                TD({class: "stylePropName"}, "$prop.name"),
                                TD({class: "stylePropValue"}, "$prop.value")
                            )
                        )
                    )
                )
            )
    }),

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    updateCascadeView: function(element)
    {
        var rules = [], sections = [], usedProps = {};
        this.getInheritedRules(element, sections, usedProps);
        this.getElementRules(element, rules, usedProps);

        if (rules.length || sections.length)
        {
            var inheritLabel = $STR("InheritedFrom");
            this.template.cascadedTag.replace({rules: rules, inherited: sections,
                inheritLabel: inheritLabel}, this.panelNode);
        }
        else
            FirebugReps.Warning.tag.replace({object: "EmptyElementCSS"}, this.panelNode);
    },

    updateComputedView: function(element)
    {
        var win = element.ownerDocument.defaultView;
        var style = win.getComputedStyle(element, "");

        var groups = [];

        for (var groupName in styleGroups)
        {
            var title = $STR("StyleGroup-" + groupName);
            var group = {title: title, props: []};
            groups.push(group);

            var props = styleGroups[groupName];
            for (var i = 0; i < props.length; ++i)
            {
                var propName = props[i];
                var propValue = rgbToHex(style.getPropertyValue(propName));
                if (propValue)
                    group.props.push({name: propName, value: propValue});
            }
        }

        this.template.computedTag.replace({groups: groups}, this.panelNode);
    },

    getStylesheetURL: function(style)
    {
        if (style && style.parentRule)
            return style.parentRule.parentStyleSheet.href;
        else
            return this.selection.ownerDocument.location.href;
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    getInheritedRules: function(element, sections, usedProps)
    {
        var parent = element.parentNode;
        if (parent && parent.nodeType == 1)
        {
            this.getInheritedRules(parent, sections, usedProps);

            var rules = [];
            this.getElementRules(parent, rules, usedProps, true);

            if (rules.length)
                sections.splice(0, 0, {element: parent, rules: rules});
        }
    },

    getElementRules: function(element, rules, usedProps, inheritMode)
    {
        var inspectedRules;
        try
        {
            inspectedRules = domUtils ? domUtils.getCSSStyleRules(element) : null;
        } catch (exc) {}

        if (inspectedRules)
        {
            for (var i = 0; i < inspectedRules.Count(); ++i)
            {
                var rule = QI(inspectedRules.GetElementAt(i), nsIDOMCSSStyleRule);

                var href = rule.parentStyleSheet.href;
                if (isSystemURL(href))
                    continue;

                var props = this.getRuleProperties(this.context, rule, inheritMode);
                if (inheritMode && !props.length)
                    continue;

                this.markOverridenProps(props, usedProps);

                var line = domUtils.getRuleLine(rule);
                var ruleId = rule.selectorText+"/"+line;
                var sourceLink = new SourceLink(href, line, "css", rule);
                rules.splice(0, 0, {rule: rule, id: ruleId,
                        selector: rule.selectorText, sourceLink: sourceLink,
                        props: props, inherited: inheritMode});
            }
        }

        this.getStyleProperties(element, rules, usedProps, inheritMode);
    },

    markOverridenProps: function(props, usedProps)
    {
        for (var i = 0; i < props.length; ++i)
        {
            var prop = props[i];
            if (prop.name in usedProps)
            {
                var deadProps = usedProps[prop.name];
                for (var j = 0; j < deadProps.length; ++j)
                {
                    var deadProp = deadProps[j];
                    if (!deadProp.disabled && deadProp.important && !prop.important)
                        prop.overridden = true;
                    else if (!prop.disabled)
                        deadProp.overridden = true;
                }
            }
            else
                usedProps[prop.name] = [];

            usedProps[prop.name].push(prop);
        }
    },

    getStyleProperties: function(element, rules, usedProps, inheritMode)
    {
        var props = [];

        var style = element.style;
        for (var i = 0; i < style.length; ++i)
        {
            var name = style.item(i);
            var value = style.getPropertyValue(name);
            var important = style.getPropertyPriority(name) == "important";
            if (value)
                this.addProperty(name, value, important, false, inheritMode, props);
        }

        this.addOldProperties(this.context, getElementXPath(element), inheritMode, props);

        sortProperties(props);
        this.markOverridenProps(props, usedProps);

        if (props.length)
            rules.splice(0, 0,
                    {rule: element, id: getElementXPath(element),
                        selector: "element.style", props: props, inherited: inheritMode});
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    // extends Panel

    name: "css",
    parentPanel: "html",

    show: function(state)
    {
        // Do nothing, and don't call superclass
    },

    supportsObject: function(object)
    {
        return object instanceof Element ? 1 : 0;
    },

    updateSelection: function(element)
    {
        if ( !(element instanceof Element) ) // html supports SourceLink
            return;

        if (sothinkInstalled)
        {
            FirebugReps.Warning.tag.replace({object: "SothinkWarning"}, this.panelNode);
            return;
        }

        if (!domUtils)
        {
            FirebugReps.Warning.tag.replace({object: "DOMInspectorWarning"}, this.panelNode);
            return;
        }

        if (!element)
            return;

        if (Firebug.showComputedStyle)
            this.updateComputedView(element);
        else
            this.updateCascadeView(element);
    },

    updateOption: function(name, value)
    {
        if (name == "showComputedStyle")
            this.refresh();
    },

    getOptionsMenuItems: function()
    {
        return [
            {label: "ShowComputedStyle", type: "checkbox", checked: Firebug.showComputedStyle,
                command: bindFixed(Firebug.togglePref, Firebug, "showComputedStyle") }
        ];
    }
});

// ************************************************************************************************
// CSSEditor

function CSSEditor(doc)
{
    this.initializeInline(doc);
}

CSSEditor.prototype = domplate(Firebug.InlineEditor.prototype,
{
    insertNewRow: function(target, insertWhere)
    {
        var emptyProp = {name: "", value: ""};
        var sibling = insertWhere == "before" ? target.previousSibling : target;

        return CSSPropTag.insertAfter({prop: emptyProp}, sibling);
    },

    saveEdit: function(target, value, previousValue)
    {
        target.innerHTML = escapeHTML(value);

        var row = getAncestorByClass(target, "cssProp");
        if (hasClass(row, "disabledStyle"))
            toggleClass(row, "disabledStyle");

        var style = Firebug.getRepObject(target);

        if (hasClass(target, "cssPropName"))
        {
            if (previousValue && previousValue != value)
                style.removeProperty(previousValue);

            if (value)
            {
                var propValue = getChildByClass(row, "cssPropValue").textContent;
                var parsedValue = parsePriority(propValue);
                style.setProperty(value, parsedValue.value, parsedValue.priority);
            }
        }
        else if (getAncestorByClass(target, "cssPropValue"))
        {
            var propName = getChildByClass(row, "cssPropName").textContent;
            var propValue = getChildByClass(row, "cssPropValue").textContent;

            if (propValue)
            {
                // XXXjoe Gecko bug workaround: Just changing priority doesn't have any effect
                // unless we remove the property first
                style.removeProperty(propName);

                var parsedValue = parsePriority(propValue);
                style.setProperty(propName, parsedValue.value, parsedValue.priority);
            }
            else
                style.removeProperty(propName);
        }

        this.panel.markChange(this.panel.name == "stylesheet");
    },

    endEditing: function()
    {
        // XXXjoe We need to refresh here, but can't because it interferes
        // with the tabbing.  The only reason to refresh is to update the
        // overridden flag on properties when !importants are changed, so
        // we should implement code to do this without destroying the view

        return true;
    },

    advanceToNext: function(target, charCode)
    {
        if (charCode == 58 /*":"*/ && hasClass(target, "cssPropName"))
            return true;
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    getAutoCompleteRange: function(value, offset)
    {
        if (hasClass(this.target, "cssPropName"))
            return {start: 0, end: value.length-1};
        else
            return parseCSSValue(value, offset);
    },

    getAutoCompleteList: function(preExpr, expr, postExpr)
    {
        if (hasClass(this.target, "cssPropName"))
        {
            return getCSSPropertyNames();
        }
        else
        {
            var row = getAncestorByClass(this.target, "cssProp");
            var propName = getChildByClass(row, "cssPropName").textContent;
            return getCSSKeywordsByProperty(propName);
        }
    }
});

// ************************************************************************************************
// StyleSheetEditor

function StyleSheetEditor(doc)
{
    this.box = this.tag.replace({}, doc, this);
    this.input = this.box.firstChild;
}

StyleSheetEditor.prototype = domplate(Firebug.BaseEditor,
{
    multiLine: true,

    tag: DIV(
        TEXTAREA({class: "styleSheetEditor fullPanelEditor", oninput: "$onInput"})
    ),

    getValue: function()
    {
        return this.input.value;
    },

    setValue: function(value)
    {
        return this.input.value = value;
    },

    show: function(target, panel, value, textSize, targetSize)
    {
        this.target = target;
        this.panel = panel;

        this.panel.panelNode.appendChild(this.box);

        this.input.value = value;
        this.input.focus();

        var command = this.panel.context.chrome.$("cmd_toggleCSSEditing");
        command.setAttribute("checked", true);
    },

    hide: function()
    {
        var chrome = this.panel.context.chrome;
        if (!chrome)
            chrome = FirebugChrome;

        var command = chrome.$("cmd_toggleCSSEditing");
        command.setAttribute("checked", false);

        if (this.box.parentNode == this.panel.panelNode)
            this.panel.panelNode.removeChild(this.box);

        delete this.target;
        delete this.panel;
        delete this.styleSheet;
    },

    saveEdit: function(target, value, previousValue)
    {
        var doc = getStyleSheetDocument(this.styleSheet);

        if (!this.styleSheet.editStyleSheet)
        {
            this.styleSheet.disabled = true;

            var url = CCSV("@mozilla.org/network/standard-url;1", Components.interfaces.nsIURL);
            url.spec = this.styleSheet.href;

            var editStyleSheet = this.editStyleSheet;
            editStyleSheet = doc.createElementNS("http://www.w3.org/1999/xhtml", "style");
            editStyleSheet.setAttribute("type", "text/css");
            editStyleSheet.setAttributeNS("http://www.w3.org/XML/1998/namespace", "base",
                url.directory);

            var head = doc.getElementsByTagName("head")[0];
            head.appendChild(editStyleSheet);

            this.styleSheet.editStyleSheet = editStyleSheet;
        }

        this.styleSheet.editStyleSheet.innerHTML = value;
    },

    endEditing: function()
    {
        this.panel.refresh();
        return true;
    },

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

    onInput: function()
    {
        Firebug.Editor.update();
    },

    scrollToLine: function(line, offset)
    {
        this.startMeasuring(this.input);
        var lineHeight = this.measureText().height;
        this.stopMeasuring();

        this.input.scrollTop = (line * lineHeight) + offset;
    }
});

// ************************************************************************************************
// Local Helpers

function rgbToHex(value)
{
    var reg = /rgb\((\d{1,3}),\s*(\d{1,3}),\s*(\d{1,3})\)/i;
    var m = reg.exec(value);
    if (!m)
        return value;

    var r = parseInt(m[1]).toString(16);
    if (r.length == 1)
        r = "0" + r;
    var g = parseInt(m[2]).toString(16);
    if (g.length == 1)
        g = "0" + g;
    var b = parseInt(m[3]).toString(16);
    if (b.length == 1)
        b = "0" + b;

    var preExpr = value.substr(0, m.index);
    var postExpr = value.substr(m.index+m[0].length);

    return preExpr + "#" + (r + g + b).toUpperCase() + postExpr;
}

function parsePriority(value)
{
    var rePriority = /(.*?)\s*(!important)?$/;
    var m = rePriority.exec(value);
    var propValue = m ? m[1] : "";
    var priority = m && m[2] ? "important" : "";
    return {value: propValue, priority: priority};
}

function parseURLValue(value)
{
    var m = reURL.exec(value);
    return m ? m[1] : "";
}

function parseRepeatValue(value)
{
    var m = reRepeat.exec(value);
    return m ? m[0] : "";
}

function parseCSSValue(value, offset)
{
    var start = 0;
    var m;
    while (1)
    {
        m = reSplitCSS.exec(value);
        if (m && m.index+m[0].length < offset)
        {
            value = value.substr(m.index+m[0].length);
            start += m.index+m[0].length;
            offset -= m.index+m[0].length;
        }
        else
            break;
    }

    if (m)
    {
        var type;
        if (m[1])
            type = "url";
        else if (m[2] || m[3])
            type = "rgb";
        else if (m[4])
            type = "int";

        return {value: m[0], start: start+m.index, end: start+m.index+(m[0].length-1), type: type};
    }
}

function findPropByName(props, name)
{
    for (var i = 0; i < props.length; ++i)
    {
        if (props[i].name == name)
            return i;
    }
}

function sortProperties(props)
{
    props.sort(function(a, b)
    {
        return a.name > b.name ? 1 : -1;
    });
}

function getTopmostRuleLine(panelNode)
{
    for (var child = panelNode.firstChild; child; child = child.nextSibling)
    {
        if (child.offsetTop+child.offsetHeight > panelNode.scrollTop)
        {
            var rule = child.repObject ? child.repObject.parentRule : null;
            if (rule)
                return {
                    line: domUtils.getRuleLine(rule),
                    offset: panelNode.scrollTop-child.offsetTop
                };
        }
    }
    return 0;
}

function getStyleSheetCSS(sheet, context)
{
    if (sheet.ownerNode instanceof HTMLStyleElement)
        return sheet.ownerNode.innerHTML;
    else
        return context.sourceCache.load(sheet.href).join("\n");
}

function getStyleSheetDocument(sheet)
{
    for (; sheet && !sheet.ownerNode; sheet = sheet.parentStyleSheet);

    return sheet.ownerNode.ownerDocument;
}

function scrollSelectionIntoView(panel)
{
    var selCon = getSelectionController(panel);
    selCon.scrollSelectionIntoView(
            nsISelectionController.SELECTION_NORMAL,
            nsISelectionController.SELECTION_FOCUS_REGION, true);
}

function getSelectionController(panel)
{
    var browser = panel.context.chrome.getPanelBrowser(panel);
    return browser.docShell.QueryInterface(nsIInterfaceRequestor)
        .getInterface(nsISelectionDisplay)
        .QueryInterface(nsISelectionController);
}

// ************************************************************************************************

Firebug.registerPanel(CSSStyleSheetPanel);
Firebug.registerPanel(CSSElementPanel);

// ************************************************************************************************

}});
