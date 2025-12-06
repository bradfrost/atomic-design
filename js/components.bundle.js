var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __commonJS = (cb, mod) => function __require() {
  return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));

// node_modules/classnames/index.js
var require_classnames = __commonJS({
  "node_modules/classnames/index.js"(exports, module) {
    (function() {
      "use strict";
      var hasOwn = {}.hasOwnProperty;
      function classNames() {
        var classes = "";
        for (var i7 = 0; i7 < arguments.length; i7++) {
          var arg = arguments[i7];
          if (arg) {
            classes = appendClass(classes, parseValue(arg));
          }
        }
        return classes;
      }
      function parseValue(arg) {
        if (typeof arg === "string" || typeof arg === "number") {
          return arg;
        }
        if (typeof arg !== "object") {
          return "";
        }
        if (Array.isArray(arg)) {
          return classNames.apply(null, arg);
        }
        if (arg.toString !== Object.prototype.toString && !arg.toString.toString().includes("[native code]")) {
          return arg.toString();
        }
        var classes = "";
        for (var key in arg) {
          if (hasOwn.call(arg, key) && arg[key]) {
            classes = appendClass(classes, key);
          }
        }
        return classes;
      }
      function appendClass(value, newClass) {
        if (!newClass) {
          return value;
        }
        if (value) {
          return value + " " + newClass;
        }
        return value + newClass;
      }
      if (typeof module !== "undefined" && module.exports) {
        classNames.default = classNames;
        module.exports = classNames;
      } else if (typeof define === "function" && typeof define.amd === "object" && define.amd) {
        define("classnames", [], function() {
          return classNames;
        });
      } else {
        window.classNames = classNames;
      }
    })();
  }
});

// node_modules/@lit/reactive-element/css-tag.js
var t = globalThis;
var e = t.ShadowRoot && (void 0 === t.ShadyCSS || t.ShadyCSS.nativeShadow) && "adoptedStyleSheets" in Document.prototype && "replace" in CSSStyleSheet.prototype;
var s = Symbol();
var o = /* @__PURE__ */ new WeakMap();
var n = class {
  constructor(t3, e5, o6) {
    if (this._$cssResult$ = true, o6 !== s) throw Error("CSSResult is not constructable. Use `unsafeCSS` or `css` instead.");
    this.cssText = t3, this.t = e5;
  }
  get styleSheet() {
    let t3 = this.o;
    const s4 = this.t;
    if (e && void 0 === t3) {
      const e5 = void 0 !== s4 && 1 === s4.length;
      e5 && (t3 = o.get(s4)), void 0 === t3 && ((this.o = t3 = new CSSStyleSheet()).replaceSync(this.cssText), e5 && o.set(s4, t3));
    }
    return t3;
  }
  toString() {
    return this.cssText;
  }
};
var r = (t3) => new n("string" == typeof t3 ? t3 : t3 + "", void 0, s);
var S = (s4, o6) => {
  if (e) s4.adoptedStyleSheets = o6.map((t3) => t3 instanceof CSSStyleSheet ? t3 : t3.styleSheet);
  else for (const e5 of o6) {
    const o7 = document.createElement("style"), n5 = t.litNonce;
    void 0 !== n5 && o7.setAttribute("nonce", n5), o7.textContent = e5.cssText, s4.appendChild(o7);
  }
};
var c = e ? (t3) => t3 : (t3) => t3 instanceof CSSStyleSheet ? ((t4) => {
  let e5 = "";
  for (const s4 of t4.cssRules) e5 += s4.cssText;
  return r(e5);
})(t3) : t3;

// node_modules/@lit/reactive-element/reactive-element.js
var { is: i2, defineProperty: e2, getOwnPropertyDescriptor: h, getOwnPropertyNames: r2, getOwnPropertySymbols: o2, getPrototypeOf: n2 } = Object;
var a = globalThis;
var c2 = a.trustedTypes;
var l = c2 ? c2.emptyScript : "";
var p = a.reactiveElementPolyfillSupport;
var d = (t3, s4) => t3;
var u = { toAttribute(t3, s4) {
  switch (s4) {
    case Boolean:
      t3 = t3 ? l : null;
      break;
    case Object:
    case Array:
      t3 = null == t3 ? t3 : JSON.stringify(t3);
  }
  return t3;
}, fromAttribute(t3, s4) {
  let i7 = t3;
  switch (s4) {
    case Boolean:
      i7 = null !== t3;
      break;
    case Number:
      i7 = null === t3 ? null : Number(t3);
      break;
    case Object:
    case Array:
      try {
        i7 = JSON.parse(t3);
      } catch (t4) {
        i7 = null;
      }
  }
  return i7;
} };
var f = (t3, s4) => !i2(t3, s4);
var b = { attribute: true, type: String, converter: u, reflect: false, useDefault: false, hasChanged: f };
Symbol.metadata ??= Symbol("metadata"), a.litPropertyMetadata ??= /* @__PURE__ */ new WeakMap();
var y = class extends HTMLElement {
  static addInitializer(t3) {
    this._$Ei(), (this.l ??= []).push(t3);
  }
  static get observedAttributes() {
    return this.finalize(), this._$Eh && [...this._$Eh.keys()];
  }
  static createProperty(t3, s4 = b) {
    if (s4.state && (s4.attribute = false), this._$Ei(), this.prototype.hasOwnProperty(t3) && ((s4 = Object.create(s4)).wrapped = true), this.elementProperties.set(t3, s4), !s4.noAccessor) {
      const i7 = Symbol(), h4 = this.getPropertyDescriptor(t3, i7, s4);
      void 0 !== h4 && e2(this.prototype, t3, h4);
    }
  }
  static getPropertyDescriptor(t3, s4, i7) {
    const { get: e5, set: r6 } = h(this.prototype, t3) ?? { get() {
      return this[s4];
    }, set(t4) {
      this[s4] = t4;
    } };
    return { get: e5, set(s5) {
      const h4 = e5?.call(this);
      r6?.call(this, s5), this.requestUpdate(t3, h4, i7);
    }, configurable: true, enumerable: true };
  }
  static getPropertyOptions(t3) {
    return this.elementProperties.get(t3) ?? b;
  }
  static _$Ei() {
    if (this.hasOwnProperty(d("elementProperties"))) return;
    const t3 = n2(this);
    t3.finalize(), void 0 !== t3.l && (this.l = [...t3.l]), this.elementProperties = new Map(t3.elementProperties);
  }
  static finalize() {
    if (this.hasOwnProperty(d("finalized"))) return;
    if (this.finalized = true, this._$Ei(), this.hasOwnProperty(d("properties"))) {
      const t4 = this.properties, s4 = [...r2(t4), ...o2(t4)];
      for (const i7 of s4) this.createProperty(i7, t4[i7]);
    }
    const t3 = this[Symbol.metadata];
    if (null !== t3) {
      const s4 = litPropertyMetadata.get(t3);
      if (void 0 !== s4) for (const [t4, i7] of s4) this.elementProperties.set(t4, i7);
    }
    this._$Eh = /* @__PURE__ */ new Map();
    for (const [t4, s4] of this.elementProperties) {
      const i7 = this._$Eu(t4, s4);
      void 0 !== i7 && this._$Eh.set(i7, t4);
    }
    this.elementStyles = this.finalizeStyles(this.styles);
  }
  static finalizeStyles(s4) {
    const i7 = [];
    if (Array.isArray(s4)) {
      const e5 = new Set(s4.flat(1 / 0).reverse());
      for (const s5 of e5) i7.unshift(c(s5));
    } else void 0 !== s4 && i7.push(c(s4));
    return i7;
  }
  static _$Eu(t3, s4) {
    const i7 = s4.attribute;
    return false === i7 ? void 0 : "string" == typeof i7 ? i7 : "string" == typeof t3 ? t3.toLowerCase() : void 0;
  }
  constructor() {
    super(), this._$Ep = void 0, this.isUpdatePending = false, this.hasUpdated = false, this._$Em = null, this._$Ev();
  }
  _$Ev() {
    this._$ES = new Promise((t3) => this.enableUpdating = t3), this._$AL = /* @__PURE__ */ new Map(), this._$E_(), this.requestUpdate(), this.constructor.l?.forEach((t3) => t3(this));
  }
  addController(t3) {
    (this._$EO ??= /* @__PURE__ */ new Set()).add(t3), void 0 !== this.renderRoot && this.isConnected && t3.hostConnected?.();
  }
  removeController(t3) {
    this._$EO?.delete(t3);
  }
  _$E_() {
    const t3 = /* @__PURE__ */ new Map(), s4 = this.constructor.elementProperties;
    for (const i7 of s4.keys()) this.hasOwnProperty(i7) && (t3.set(i7, this[i7]), delete this[i7]);
    t3.size > 0 && (this._$Ep = t3);
  }
  createRenderRoot() {
    const t3 = this.shadowRoot ?? this.attachShadow(this.constructor.shadowRootOptions);
    return S(t3, this.constructor.elementStyles), t3;
  }
  connectedCallback() {
    this.renderRoot ??= this.createRenderRoot(), this.enableUpdating(true), this._$EO?.forEach((t3) => t3.hostConnected?.());
  }
  enableUpdating(t3) {
  }
  disconnectedCallback() {
    this._$EO?.forEach((t3) => t3.hostDisconnected?.());
  }
  attributeChangedCallback(t3, s4, i7) {
    this._$AK(t3, i7);
  }
  _$ET(t3, s4) {
    const i7 = this.constructor.elementProperties.get(t3), e5 = this.constructor._$Eu(t3, i7);
    if (void 0 !== e5 && true === i7.reflect) {
      const h4 = (void 0 !== i7.converter?.toAttribute ? i7.converter : u).toAttribute(s4, i7.type);
      this._$Em = t3, null == h4 ? this.removeAttribute(e5) : this.setAttribute(e5, h4), this._$Em = null;
    }
  }
  _$AK(t3, s4) {
    const i7 = this.constructor, e5 = i7._$Eh.get(t3);
    if (void 0 !== e5 && this._$Em !== e5) {
      const t4 = i7.getPropertyOptions(e5), h4 = "function" == typeof t4.converter ? { fromAttribute: t4.converter } : void 0 !== t4.converter?.fromAttribute ? t4.converter : u;
      this._$Em = e5;
      const r6 = h4.fromAttribute(s4, t4.type);
      this[e5] = r6 ?? this._$Ej?.get(e5) ?? r6, this._$Em = null;
    }
  }
  requestUpdate(t3, s4, i7) {
    if (void 0 !== t3) {
      const e5 = this.constructor, h4 = this[t3];
      if (i7 ??= e5.getPropertyOptions(t3), !((i7.hasChanged ?? f)(h4, s4) || i7.useDefault && i7.reflect && h4 === this._$Ej?.get(t3) && !this.hasAttribute(e5._$Eu(t3, i7)))) return;
      this.C(t3, s4, i7);
    }
    false === this.isUpdatePending && (this._$ES = this._$EP());
  }
  C(t3, s4, { useDefault: i7, reflect: e5, wrapped: h4 }, r6) {
    i7 && !(this._$Ej ??= /* @__PURE__ */ new Map()).has(t3) && (this._$Ej.set(t3, r6 ?? s4 ?? this[t3]), true !== h4 || void 0 !== r6) || (this._$AL.has(t3) || (this.hasUpdated || i7 || (s4 = void 0), this._$AL.set(t3, s4)), true === e5 && this._$Em !== t3 && (this._$Eq ??= /* @__PURE__ */ new Set()).add(t3));
  }
  async _$EP() {
    this.isUpdatePending = true;
    try {
      await this._$ES;
    } catch (t4) {
      Promise.reject(t4);
    }
    const t3 = this.scheduleUpdate();
    return null != t3 && await t3, !this.isUpdatePending;
  }
  scheduleUpdate() {
    return this.performUpdate();
  }
  performUpdate() {
    if (!this.isUpdatePending) return;
    if (!this.hasUpdated) {
      if (this.renderRoot ??= this.createRenderRoot(), this._$Ep) {
        for (const [t5, s5] of this._$Ep) this[t5] = s5;
        this._$Ep = void 0;
      }
      const t4 = this.constructor.elementProperties;
      if (t4.size > 0) for (const [s5, i7] of t4) {
        const { wrapped: t5 } = i7, e5 = this[s5];
        true !== t5 || this._$AL.has(s5) || void 0 === e5 || this.C(s5, void 0, i7, e5);
      }
    }
    let t3 = false;
    const s4 = this._$AL;
    try {
      t3 = this.shouldUpdate(s4), t3 ? (this.willUpdate(s4), this._$EO?.forEach((t4) => t4.hostUpdate?.()), this.update(s4)) : this._$EM();
    } catch (s5) {
      throw t3 = false, this._$EM(), s5;
    }
    t3 && this._$AE(s4);
  }
  willUpdate(t3) {
  }
  _$AE(t3) {
    this._$EO?.forEach((t4) => t4.hostUpdated?.()), this.hasUpdated || (this.hasUpdated = true, this.firstUpdated(t3)), this.updated(t3);
  }
  _$EM() {
    this._$AL = /* @__PURE__ */ new Map(), this.isUpdatePending = false;
  }
  get updateComplete() {
    return this.getUpdateComplete();
  }
  getUpdateComplete() {
    return this._$ES;
  }
  shouldUpdate(t3) {
    return true;
  }
  update(t3) {
    this._$Eq &&= this._$Eq.forEach((t4) => this._$ET(t4, this[t4])), this._$EM();
  }
  updated(t3) {
  }
  firstUpdated(t3) {
  }
};
y.elementStyles = [], y.shadowRootOptions = { mode: "open" }, y[d("elementProperties")] = /* @__PURE__ */ new Map(), y[d("finalized")] = /* @__PURE__ */ new Map(), p?.({ ReactiveElement: y }), (a.reactiveElementVersions ??= []).push("2.1.1");

// node_modules/lit-html/lit-html.js
var t2 = globalThis;
var i3 = t2.trustedTypes;
var s2 = i3 ? i3.createPolicy("lit-html", { createHTML: (t3) => t3 }) : void 0;
var e3 = "$lit$";
var h2 = `lit$${Math.random().toFixed(9).slice(2)}$`;
var o3 = "?" + h2;
var n3 = `<${o3}>`;
var r3 = document;
var l2 = () => r3.createComment("");
var c3 = (t3) => null === t3 || "object" != typeof t3 && "function" != typeof t3;
var a2 = Array.isArray;
var u2 = (t3) => a2(t3) || "function" == typeof t3?.[Symbol.iterator];
var d2 = "[ 	\n\f\r]";
var f2 = /<(?:(!--|\/[^a-zA-Z])|(\/?[a-zA-Z][^>\s]*)|(\/?$))/g;
var v = /-->/g;
var _ = />/g;
var m = RegExp(`>|${d2}(?:([^\\s"'>=/]+)(${d2}*=${d2}*(?:[^ 	
\f\r"'\`<>=]|("|')|))|$)`, "g");
var p2 = /'/g;
var g = /"/g;
var $ = /^(?:script|style|textarea|title)$/i;
var y2 = (t3) => (i7, ...s4) => ({ _$litType$: t3, strings: i7, values: s4 });
var x = y2(1);
var b2 = y2(2);
var w = y2(3);
var T = Symbol.for("lit-noChange");
var E = Symbol.for("lit-nothing");
var A = /* @__PURE__ */ new WeakMap();
var C = r3.createTreeWalker(r3, 129);
function P(t3, i7) {
  if (!a2(t3) || !t3.hasOwnProperty("raw")) throw Error("invalid template strings array");
  return void 0 !== s2 ? s2.createHTML(i7) : i7;
}
var V = (t3, i7) => {
  const s4 = t3.length - 1, o6 = [];
  let r6, l3 = 2 === i7 ? "<svg>" : 3 === i7 ? "<math>" : "", c5 = f2;
  for (let i8 = 0; i8 < s4; i8++) {
    const s5 = t3[i8];
    let a4, u5, d4 = -1, y3 = 0;
    for (; y3 < s5.length && (c5.lastIndex = y3, u5 = c5.exec(s5), null !== u5); ) y3 = c5.lastIndex, c5 === f2 ? "!--" === u5[1] ? c5 = v : void 0 !== u5[1] ? c5 = _ : void 0 !== u5[2] ? ($.test(u5[2]) && (r6 = RegExp("</" + u5[2], "g")), c5 = m) : void 0 !== u5[3] && (c5 = m) : c5 === m ? ">" === u5[0] ? (c5 = r6 ?? f2, d4 = -1) : void 0 === u5[1] ? d4 = -2 : (d4 = c5.lastIndex - u5[2].length, a4 = u5[1], c5 = void 0 === u5[3] ? m : '"' === u5[3] ? g : p2) : c5 === g || c5 === p2 ? c5 = m : c5 === v || c5 === _ ? c5 = f2 : (c5 = m, r6 = void 0);
    const x2 = c5 === m && t3[i8 + 1].startsWith("/>") ? " " : "";
    l3 += c5 === f2 ? s5 + n3 : d4 >= 0 ? (o6.push(a4), s5.slice(0, d4) + e3 + s5.slice(d4) + h2 + x2) : s5 + h2 + (-2 === d4 ? i8 : x2);
  }
  return [P(t3, l3 + (t3[s4] || "<?>") + (2 === i7 ? "</svg>" : 3 === i7 ? "</math>" : "")), o6];
};
var N = class _N {
  constructor({ strings: t3, _$litType$: s4 }, n5) {
    let r6;
    this.parts = [];
    let c5 = 0, a4 = 0;
    const u5 = t3.length - 1, d4 = this.parts, [f4, v2] = V(t3, s4);
    if (this.el = _N.createElement(f4, n5), C.currentNode = this.el.content, 2 === s4 || 3 === s4) {
      const t4 = this.el.content.firstChild;
      t4.replaceWith(...t4.childNodes);
    }
    for (; null !== (r6 = C.nextNode()) && d4.length < u5; ) {
      if (1 === r6.nodeType) {
        if (r6.hasAttributes()) for (const t4 of r6.getAttributeNames()) if (t4.endsWith(e3)) {
          const i7 = v2[a4++], s5 = r6.getAttribute(t4).split(h2), e5 = /([.?@])?(.*)/.exec(i7);
          d4.push({ type: 1, index: c5, name: e5[2], strings: s5, ctor: "." === e5[1] ? H : "?" === e5[1] ? I : "@" === e5[1] ? L : k }), r6.removeAttribute(t4);
        } else t4.startsWith(h2) && (d4.push({ type: 6, index: c5 }), r6.removeAttribute(t4));
        if ($.test(r6.tagName)) {
          const t4 = r6.textContent.split(h2), s5 = t4.length - 1;
          if (s5 > 0) {
            r6.textContent = i3 ? i3.emptyScript : "";
            for (let i7 = 0; i7 < s5; i7++) r6.append(t4[i7], l2()), C.nextNode(), d4.push({ type: 2, index: ++c5 });
            r6.append(t4[s5], l2());
          }
        }
      } else if (8 === r6.nodeType) if (r6.data === o3) d4.push({ type: 2, index: c5 });
      else {
        let t4 = -1;
        for (; -1 !== (t4 = r6.data.indexOf(h2, t4 + 1)); ) d4.push({ type: 7, index: c5 }), t4 += h2.length - 1;
      }
      c5++;
    }
  }
  static createElement(t3, i7) {
    const s4 = r3.createElement("template");
    return s4.innerHTML = t3, s4;
  }
};
function S2(t3, i7, s4 = t3, e5) {
  if (i7 === T) return i7;
  let h4 = void 0 !== e5 ? s4._$Co?.[e5] : s4._$Cl;
  const o6 = c3(i7) ? void 0 : i7._$litDirective$;
  return h4?.constructor !== o6 && (h4?._$AO?.(false), void 0 === o6 ? h4 = void 0 : (h4 = new o6(t3), h4._$AT(t3, s4, e5)), void 0 !== e5 ? (s4._$Co ??= [])[e5] = h4 : s4._$Cl = h4), void 0 !== h4 && (i7 = S2(t3, h4._$AS(t3, i7.values), h4, e5)), i7;
}
var M = class {
  constructor(t3, i7) {
    this._$AV = [], this._$AN = void 0, this._$AD = t3, this._$AM = i7;
  }
  get parentNode() {
    return this._$AM.parentNode;
  }
  get _$AU() {
    return this._$AM._$AU;
  }
  u(t3) {
    const { el: { content: i7 }, parts: s4 } = this._$AD, e5 = (t3?.creationScope ?? r3).importNode(i7, true);
    C.currentNode = e5;
    let h4 = C.nextNode(), o6 = 0, n5 = 0, l3 = s4[0];
    for (; void 0 !== l3; ) {
      if (o6 === l3.index) {
        let i8;
        2 === l3.type ? i8 = new R(h4, h4.nextSibling, this, t3) : 1 === l3.type ? i8 = new l3.ctor(h4, l3.name, l3.strings, this, t3) : 6 === l3.type && (i8 = new z(h4, this, t3)), this._$AV.push(i8), l3 = s4[++n5];
      }
      o6 !== l3?.index && (h4 = C.nextNode(), o6++);
    }
    return C.currentNode = r3, e5;
  }
  p(t3) {
    let i7 = 0;
    for (const s4 of this._$AV) void 0 !== s4 && (void 0 !== s4.strings ? (s4._$AI(t3, s4, i7), i7 += s4.strings.length - 2) : s4._$AI(t3[i7])), i7++;
  }
};
var R = class _R {
  get _$AU() {
    return this._$AM?._$AU ?? this._$Cv;
  }
  constructor(t3, i7, s4, e5) {
    this.type = 2, this._$AH = E, this._$AN = void 0, this._$AA = t3, this._$AB = i7, this._$AM = s4, this.options = e5, this._$Cv = e5?.isConnected ?? true;
  }
  get parentNode() {
    let t3 = this._$AA.parentNode;
    const i7 = this._$AM;
    return void 0 !== i7 && 11 === t3?.nodeType && (t3 = i7.parentNode), t3;
  }
  get startNode() {
    return this._$AA;
  }
  get endNode() {
    return this._$AB;
  }
  _$AI(t3, i7 = this) {
    t3 = S2(this, t3, i7), c3(t3) ? t3 === E || null == t3 || "" === t3 ? (this._$AH !== E && this._$AR(), this._$AH = E) : t3 !== this._$AH && t3 !== T && this._(t3) : void 0 !== t3._$litType$ ? this.$(t3) : void 0 !== t3.nodeType ? this.T(t3) : u2(t3) ? this.k(t3) : this._(t3);
  }
  O(t3) {
    return this._$AA.parentNode.insertBefore(t3, this._$AB);
  }
  T(t3) {
    this._$AH !== t3 && (this._$AR(), this._$AH = this.O(t3));
  }
  _(t3) {
    this._$AH !== E && c3(this._$AH) ? this._$AA.nextSibling.data = t3 : this.T(r3.createTextNode(t3)), this._$AH = t3;
  }
  $(t3) {
    const { values: i7, _$litType$: s4 } = t3, e5 = "number" == typeof s4 ? this._$AC(t3) : (void 0 === s4.el && (s4.el = N.createElement(P(s4.h, s4.h[0]), this.options)), s4);
    if (this._$AH?._$AD === e5) this._$AH.p(i7);
    else {
      const t4 = new M(e5, this), s5 = t4.u(this.options);
      t4.p(i7), this.T(s5), this._$AH = t4;
    }
  }
  _$AC(t3) {
    let i7 = A.get(t3.strings);
    return void 0 === i7 && A.set(t3.strings, i7 = new N(t3)), i7;
  }
  k(t3) {
    a2(this._$AH) || (this._$AH = [], this._$AR());
    const i7 = this._$AH;
    let s4, e5 = 0;
    for (const h4 of t3) e5 === i7.length ? i7.push(s4 = new _R(this.O(l2()), this.O(l2()), this, this.options)) : s4 = i7[e5], s4._$AI(h4), e5++;
    e5 < i7.length && (this._$AR(s4 && s4._$AB.nextSibling, e5), i7.length = e5);
  }
  _$AR(t3 = this._$AA.nextSibling, i7) {
    for (this._$AP?.(false, true, i7); t3 !== this._$AB; ) {
      const i8 = t3.nextSibling;
      t3.remove(), t3 = i8;
    }
  }
  setConnected(t3) {
    void 0 === this._$AM && (this._$Cv = t3, this._$AP?.(t3));
  }
};
var k = class {
  get tagName() {
    return this.element.tagName;
  }
  get _$AU() {
    return this._$AM._$AU;
  }
  constructor(t3, i7, s4, e5, h4) {
    this.type = 1, this._$AH = E, this._$AN = void 0, this.element = t3, this.name = i7, this._$AM = e5, this.options = h4, s4.length > 2 || "" !== s4[0] || "" !== s4[1] ? (this._$AH = Array(s4.length - 1).fill(new String()), this.strings = s4) : this._$AH = E;
  }
  _$AI(t3, i7 = this, s4, e5) {
    const h4 = this.strings;
    let o6 = false;
    if (void 0 === h4) t3 = S2(this, t3, i7, 0), o6 = !c3(t3) || t3 !== this._$AH && t3 !== T, o6 && (this._$AH = t3);
    else {
      const e6 = t3;
      let n5, r6;
      for (t3 = h4[0], n5 = 0; n5 < h4.length - 1; n5++) r6 = S2(this, e6[s4 + n5], i7, n5), r6 === T && (r6 = this._$AH[n5]), o6 ||= !c3(r6) || r6 !== this._$AH[n5], r6 === E ? t3 = E : t3 !== E && (t3 += (r6 ?? "") + h4[n5 + 1]), this._$AH[n5] = r6;
    }
    o6 && !e5 && this.j(t3);
  }
  j(t3) {
    t3 === E ? this.element.removeAttribute(this.name) : this.element.setAttribute(this.name, t3 ?? "");
  }
};
var H = class extends k {
  constructor() {
    super(...arguments), this.type = 3;
  }
  j(t3) {
    this.element[this.name] = t3 === E ? void 0 : t3;
  }
};
var I = class extends k {
  constructor() {
    super(...arguments), this.type = 4;
  }
  j(t3) {
    this.element.toggleAttribute(this.name, !!t3 && t3 !== E);
  }
};
var L = class extends k {
  constructor(t3, i7, s4, e5, h4) {
    super(t3, i7, s4, e5, h4), this.type = 5;
  }
  _$AI(t3, i7 = this) {
    if ((t3 = S2(this, t3, i7, 0) ?? E) === T) return;
    const s4 = this._$AH, e5 = t3 === E && s4 !== E || t3.capture !== s4.capture || t3.once !== s4.once || t3.passive !== s4.passive, h4 = t3 !== E && (s4 === E || e5);
    e5 && this.element.removeEventListener(this.name, this, s4), h4 && this.element.addEventListener(this.name, this, t3), this._$AH = t3;
  }
  handleEvent(t3) {
    "function" == typeof this._$AH ? this._$AH.call(this.options?.host ?? this.element, t3) : this._$AH.handleEvent(t3);
  }
};
var z = class {
  constructor(t3, i7, s4) {
    this.element = t3, this.type = 6, this._$AN = void 0, this._$AM = i7, this.options = s4;
  }
  get _$AU() {
    return this._$AM._$AU;
  }
  _$AI(t3) {
    S2(this, t3);
  }
};
var j = t2.litHtmlPolyfillSupport;
j?.(N, R), (t2.litHtmlVersions ??= []).push("3.3.1");
var B = (t3, i7, s4) => {
  const e5 = s4?.renderBefore ?? i7;
  let h4 = e5._$litPart$;
  if (void 0 === h4) {
    const t4 = s4?.renderBefore ?? null;
    e5._$litPart$ = h4 = new R(i7.insertBefore(l2(), t4), t4, void 0, s4 ?? {});
  }
  return h4._$AI(t3), h4;
};

// node_modules/lit-element/lit-element.js
var s3 = globalThis;
var i4 = class extends y {
  constructor() {
    super(...arguments), this.renderOptions = { host: this }, this._$Do = void 0;
  }
  createRenderRoot() {
    const t3 = super.createRenderRoot();
    return this.renderOptions.renderBefore ??= t3.firstChild, t3;
  }
  update(t3) {
    const r6 = this.render();
    this.hasUpdated || (this.renderOptions.isConnected = this.isConnected), super.update(t3), this._$Do = B(r6, this.renderRoot, this.renderOptions);
  }
  connectedCallback() {
    super.connectedCallback(), this._$Do?.setConnected(true);
  }
  disconnectedCallback() {
    super.disconnectedCallback(), this._$Do?.setConnected(false);
  }
  render() {
    return T;
  }
};
i4._$litElement$ = true, i4["finalized"] = true, s3.litElementHydrateSupport?.({ LitElement: i4 });
var o4 = s3.litElementPolyfillSupport;
o4?.({ LitElement: i4 });
(s3.litElementVersions ??= []).push("4.2.1");

// node_modules/@brad-frost-web/eddie-web-components/components/EdElement.js
var import_classnames = __toESM(require_classnames(), 1);

// node_modules/@lit/reactive-element/decorators/property.js
var o5 = { attribute: true, type: String, converter: u, reflect: false, hasChanged: f };
var r4 = (t3 = o5, e5, r6) => {
  const { kind: n5, metadata: i7 } = r6;
  let s4 = globalThis.litPropertyMetadata.get(i7);
  if (void 0 === s4 && globalThis.litPropertyMetadata.set(i7, s4 = /* @__PURE__ */ new Map()), "setter" === n5 && ((t3 = Object.create(t3)).wrapped = true), s4.set(r6.name, t3), "accessor" === n5) {
    const { name: o6 } = r6;
    return { set(r7) {
      const n6 = e5.get.call(this);
      e5.set.call(this, r7), this.requestUpdate(o6, n6, t3);
    }, init(e6) {
      return void 0 !== e6 && this.C(o6, void 0, t3, e6), e6;
    } };
  }
  if ("setter" === n5) {
    const { name: o6 } = r6;
    return function(r7) {
      const n6 = this[o6];
      e5.call(this, r7), this.requestUpdate(o6, n6, t3);
    };
  }
  throw Error("Unsupported decorator location: " + n5);
};
function n4(t3) {
  return (e5, o6) => "object" == typeof o6 ? r4(t3, e5, o6) : ((t4, e6, o7) => {
    const r6 = e6.hasOwnProperty(o7);
    return e6.constructor.createProperty(o7, t4), r6 ? Object.getOwnPropertyDescriptor(e6, o7) : void 0;
  })(t3, e5, o6);
}

// node_modules/@brad-frost-web/eddie-web-components/components/EdElement.js
var u3 = Object.defineProperty;
var d3 = (n5, t3, r6, l3) => {
  for (var e5 = void 0, s4 = n5.length - 1, o6; s4 >= 0; s4--)
    (o6 = n5[s4]) && (e5 = o6(t3, r6, e5) || e5);
  return e5 && u3(t3, r6, e5), e5;
};
var f3 = class extends i4 {
  /**
   * Abstraction of `classnames` that automatically includes any style modifier
   * as well as any set variants.
   *
   * It is expected that `variant` would be overridden in a subclass with more
   * specific types, `@property() variant?: 'foo' | 'bar'`
   *
   * @param baseClassName
   */
  componentClassNames(t3, r6 = {}) {
    return (0, import_classnames.default)(t3, r6);
  }
  /**
   * Check if a slot is empty
   *
   * @param slotName
   */
  slotEmpty(t3) {
    return !this.querySelector(`[slot="${t3}"]`);
  }
  /**
   * Check if a slot is not empty
   *
   * @param slotName
   */
  slotNotEmpty(t3) {
    if (!this.slotEmpty(t3))
      return !this.slotEmpty(t3);
  }
  /**
   * Dispatch a custom event.
   */
  dispatch({ e: t3, eventName: r6, detailObj: l3 = {}, optionsObj: e5 = {} }) {
    const s4 = {
      bubbles: true,
      composed: true,
      ...e5,
      detail: { ...t3 && { originalEvent: t3 }, ...l3 }
    }, o6 = new CustomEvent(r6, s4);
    return this.dispatchEvent(o6), o6;
  }
  /**
   * Example render, should not be used
   */
  render() {
    return x`<slot></slot>`;
  }
};
d3([
  n4()
], f3.prototype, "styleModifier");

// node_modules/@brad-frost-web/eddie-web-components/components/layout-container/layout-container.js
var c4 = '@charset "UTF-8";:root,:host{--size-base-unit: .5rem}*,::slotted(*),*:before,*:after{box-sizing:border-box}h1,h2,h3,h4,h5,h6{margin:0}.ed-l-layout-container{width:100%;max-width:var(--ed-layout-container-max-width, 70rem);padding-right:1rem;padding-left:1rem;margin:0 auto}.ed-l-layout-container--narrow{max-width:50rem}';
var h3 = Object.defineProperty;
var u4 = (r6, e5, a4, f4) => {
  for (var t3 = void 0, o6 = r6.length - 1, n5; o6 >= 0; o6--)
    (n5 = r6[o6]) && (t3 = n5(e5, a4, t3) || t3);
  return t3 && h3(e5, a4, t3), t3;
};
var i6 = class extends f3 {
  static get styles() {
    return r(c4);
  }
  render() {
    const e5 = this.componentClassNames("ed-l-layout-container", {
      "ed-l-layout-container--narrow": this.variant === "narrow"
    });
    return x`
      <div class="${e5}">
        <slot></slot>
      </div>
    `;
  }
};
u4([
  n4()
], i6.prototype, "variant");
customElements.get("ed-layout-container") === void 0 && customElements.define("ed-layout-container", i6);

// node_modules/@brad-frost-web/eddie-web-components/components/black-friday-banner/black-friday-banner.js
var r5 = ":root,:host{--size-base-unit: .5rem}*,::slotted(*),*:before,*:after{box-sizing:border-box}h1,h2,h3,h4,h5,h6{margin:0}.ed-c-black-friday-banner{width:100%;padding:1rem 0;background:var(--ed-theme-color-background-brand-knockout);color:var(--ed-theme-color-content-knockout)}::slotted(a){color:var(--ed-theme-color-content-knockout)}::slotted(a):hover,::slotted(a):focus{text-decoration:none}";
var a3 = class extends f3 {
  static get styles() {
    return r(r5.toString());
  }
  render() {
    const e5 = this.componentClassNames("ed-c-black-friday-banner", {});
    return x`
      <div class="${e5}" role="banner">
        <ed-layout-container>
          <slot></slot>
        </ed-layout-container>
      </div>
    `;
  }
};
customElements.get("ed-black-friday-banner") === void 0 && customElements.define("ed-black-friday-banner", a3);
/*! Bundled license information:

classnames/index.js:
  (*!
  	Copyright (c) 2018 Jed Watson.
  	Licensed under the MIT License (MIT), see
  	http://jedwatson.github.io/classnames
  *)

@lit/reactive-element/css-tag.js:
  (**
   * @license
   * Copyright 2019 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/reactive-element.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

lit-html/lit-html.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

lit-element/lit-element.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

lit-html/is-server.js:
  (**
   * @license
   * Copyright 2022 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/custom-element.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/property.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/state.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/event-options.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/base.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/query.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/query-all.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/query-async.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/query-assigned-elements.js:
  (**
   * @license
   * Copyright 2021 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)

@lit/reactive-element/decorators/query-assigned-nodes.js:
  (**
   * @license
   * Copyright 2017 Google LLC
   * SPDX-License-Identifier: BSD-3-Clause
   *)
*/
