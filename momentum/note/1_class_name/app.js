const h1 = document.querySelector(".hello h1:first-child")
console.dir(h1);

// 이런 방식은 className을 바꾸면서 원래 className을 제거하기 때문에 좋지 않다.
function click_handler() {
	const clickedClass = "active";
	if(h1.className === clickedClass) {
		h1.className = "";
	} else {
		h1.className = clickedClass;
	}
}

// h1.addEventListener("click", click_handler);
h1.onclick = click_handler;