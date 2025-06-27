// Modal functionality
document.addEventListener("DOMContentLoaded", function () {
	const modal = document.querySelector(".modal");
	const closeButton = document.querySelector(".modal__close-button");

	if (closeButton && modal) {
		closeButton.addEventListener("click", function () {
			modal.close();
		});
	}

	const openButton = document.querySelector(".modal__open-button");
	if (openButton) {
		openButton.addEventListener("click", function () {
			modal.showModal();
		});
	}
});
