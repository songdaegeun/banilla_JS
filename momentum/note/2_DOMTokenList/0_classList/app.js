const h1 = document.querySelector(".hello h1:first-child")
console.dir(h1);

function click_handler() {
	const clickedClass = "active";
	if(h1.classList.contains(clickedClass)) {
		h1.classList.remove(clickedClass);
	} else {
		h1.classList.add(clickedClass);
	}
}

// h1.addEventListener("click", click_handler);
h1.onclick = click_handler;