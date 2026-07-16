// Course marketing modal for the book's interior (chapter) pages.
//
// A centered modal shown once per reader — only after they've engaged
// (scrolled ~50% of the page OR spent ~10s), never on load. Dismissal is
// remembered via localStorage so returning readers aren't nagged twice.
// (The fixed course banner is always present and needs no script.)
//
// The modal is Eddie's <ed-modal> (see _includes/course-modal.html). As of
// Eddie 0.39 it renders a native <dialog> opened in modal mode, so the browser
// provides the backdrop, focus trap, Esc-to-close and focus restore. This
// script only decides *when* to open it (reader engagement) and flips isActive.

(function () {
	"use strict";

	var MODAL_KEY = "adc-modal-seen";
	var SCROLL_THRESHOLD = 0.5; // 50% of the scrollable page
	var TIME_DELAY = 10000; // 10s fallback

	function store(key) {
		try {
			localStorage.setItem(key, "1");
		} catch (e) {
			/* storage unavailable (private mode) — degrade silently */
		}
	}

	function stored(key) {
		try {
			return localStorage.getItem(key) === "1";
		} catch (e) {
			return false;
		}
	}

	function initModal() {
		var modal = document.getElementById("course-modal");
		if (!modal) return;
		if (stored(MODAL_KEY)) return;

		var opened = false;
		var timer = null;

		function open() {
			if (opened) return;
			opened = true;
			cleanup();
			store(MODAL_KEY);
			// Native <dialog> (Eddie 0.39) handles backdrop, focus trap,
			// Esc-to-close and focus restore once it's active.
			modal.isActive = true;
		}

		function onScroll() {
			var doc = document.documentElement;
			var scrollable = doc.scrollHeight - window.innerHeight;
			if (scrollable <= 0) return;
			if (window.scrollY / scrollable >= SCROLL_THRESHOLD) open();
		}

		function cleanup() {
			window.removeEventListener("scroll", onScroll);
			if (timer) clearTimeout(timer);
		}

		// Only start once the custom element is defined, so modal.isActive exists.
		function wire() {
			window.addEventListener("scroll", onScroll, { passive: true });
			timer = setTimeout(open, TIME_DELAY);
			// Handle a page that loads already past the threshold (scroll
			// restoration on reload, or a deep link into the middle of a chapter).
			onScroll();
		}

		if (window.customElements && customElements.whenDefined) {
			customElements.whenDefined("ed-modal").then(wire);
		} else {
			wire();
		}
	}

	if (document.readyState === "loading") {
		document.addEventListener("DOMContentLoaded", initModal);
	} else {
		initModal();
	}
})();
