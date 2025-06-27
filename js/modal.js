// Modal functionality
document.addEventListener("DOMContentLoaded", function () {
	const modal = document.querySelector(".modal");
	const closeButton = document.querySelector(".modal__close-button");

	if (closeButton && modal) {
		closeButton.addEventListener("click", function () {
			modal.close();
			// Reset height to 0 when modal closes
			modal.style.height = "0px";
		});
	}

	const openButton = document.querySelector(".modal__open-button");
	if (openButton) {
		openButton.addEventListener("click", function () {
			modal.showModal();

			// 40em = 640px
			// First, ensure modal starts at height 0 for the transition
			modal.style.height = "0px";

			// Force a reflow to ensure the 0px height is applied
			modal.offsetHeight;

			// Temporarily set height to auto to get the natural height
			// modal.style.height = "auto";
			const contentHeight = modal.scrollHeight;

			// Calculate the height of modal contents for larger screens
			if (window.innerWidth >= 640) {
				// Set the calculated height to enable smooth transition from 0 to content height
				modal.style.height = contentHeight + "px";
				// After transition completes, set height to auto for dynamic content
				const handleTransitionEnd = function () {
					modal.style.height = "auto";
					modal.removeEventListener("transitionend", handleTransitionEnd);
				};
				modal.addEventListener("transitionend", handleTransitionEnd);
			} else {
				modal.style.height = "100vh";
			}
		});
	}
});
