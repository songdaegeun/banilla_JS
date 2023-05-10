const h1 = document.querySelector(".hello h1:first-child")
console.dir(h1);

function click_handler() {
	h1.classList.toggle("active");
}
// If force is not given, "toggles" token, removing it if it's present and adding it if it's not present. If force is true, adds token (same as add()). If force is false, removes token (same as remove()).


// h1.addEventListener("click", click_handler);
h1.onclick = click_handler;