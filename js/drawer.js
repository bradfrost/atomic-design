// drawer functionality
document.addEventListener("DOMContentLoaded", function () {
	const drawer = document.querySelector(".drawer");
	const closeButton = document.querySelector(".drawer__close-button");

	if (drawer && localStorage.getItem("bfwDrawerClosed")) {
		drawer.close();
	} else {
		drawer.showModal();
		closeButton.focus();
	}

	if (closeButton && drawer) {
		closeButton.addEventListener("click", function () {
			drawer.close();
			// Set the flag in local storage
			localStorage.setItem("bfwDrawerClosed", "true");
		});

		document.addEventListener("keydown", function (event) {
			if (event.key === "Escape" && drawer.open) {
				drawer.close();
				localStorage.setItem("bfwDrawerClosed", "true");
			}
		});
	}
});
