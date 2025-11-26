document.addEventListener("DOMContentLoaded", () => {
	console.log("DOMContentLoaded");
	// Listen for the black friday modal close event
	const blackFridayModal = document.querySelector("ed-black-friday-modal");
	if (blackFridayModal) {
		// Only set isActive to true if the modal hasn't been closed before
		const modalClosed = localStorage.getItem(
			"atomicDesignBookBlackFridayModalClosed"
		);
		if (!modalClosed || modalClosed === "false") {
			blackFridayModal.setAttribute("isActive", "true");
		}

		blackFridayModal.addEventListener("ed-black-friday-modal-close", () => {
			localStorage.setItem("atomicDesignBookBlackFridayModalClosed", "true");
		});
	}
});
