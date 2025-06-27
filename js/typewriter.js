// Add js-enabled class to body for progressive enhancement
document.addEventListener("DOMContentLoaded", function () {
	document.body.classList.add("js");

	// Typewriter effect for speech bubble - progressive enhancement
	const typewriterText = document.querySelector(".typewriter-text");
	const cursor = document.querySelector(".cursor");

	if (!typewriterText || !cursor) return;

	const text = typewriterText.textContent;
	let index = 0;

	// Clear the text to start fresh
	typewriterText.textContent = "";

	function typeWriter() {
		if (index < text.length) {
			typewriterText.textContent += text.charAt(index);
			index++;
			setTimeout(typeWriter, 50); // Adjust speed here (lower = faster)
		} else {
			// Hide cursor when typing is complete
			cursor.style.opacity = "0";
		}
	}

	// Start typing when page loads
	window.addEventListener("load", () => {
		setTimeout(typeWriter, 1000); // Delay before starting
	});
});
