let Hamburger = document.getElementById("Hamburger-icon");
let navlinks = document.querySelector(".nav-links");

if (Hamburger) {
	Hamburger.addEventListener("click", () => {
		if (navlinks) navlinks.classList.toggle("open");
	});
}