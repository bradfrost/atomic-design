// Course marketing modal for the book's interior (chapter) pages.
//
// A centered <dialog> shown once per reader — only after they've engaged
// (scrolled ~50% of the page OR spent ~15s), never on load. Dismissal is
// remembered via localStorage so returning readers aren't nagged twice.
// (The fixed course banner is always present and needs no script.)

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
		if (!modal || typeof modal.showModal !== "function") return;
		if (stored(MODAL_KEY)) return;

		var opened = false;
		var timer = null;

		function open() {
			if (opened) return;
			opened = true;
			cleanup();
			store(MODAL_KEY);
			modal.showModal();
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

		window.addEventListener("scroll", onScroll, { passive: true });
		timer = setTimeout(open, TIME_DELAY);
		// Handle a page that loads already past the threshold (scroll
		// restoration on reload, or a deep link into the middle of a chapter).
		onScroll();

		// Close interactions (Esc is handled natively by <dialog>).
		var dismiss = modal.querySelector(".course-modal__dismiss");
		if (dismiss) {
			dismiss.addEventListener("click", function () {
				modal.close();
			});
		}
		// Click on the backdrop (outside the inner panel) closes the modal.
		modal.addEventListener("click", function (event) {
			if (event.target === modal) modal.close();
		});
	}

	if (document.readyState === "loading") {
		document.addEventListener("DOMContentLoaded", initModal);
	} else {
		initModal();
	}
})();
