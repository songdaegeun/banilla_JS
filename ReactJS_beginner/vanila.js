const click = document.querySelector("#click");
const disp_cnt = click.querySelector("span");
const button = click.querySelector("button");
let cnt = 0;

function clickHandler() {
	cnt++;
	disp_cnt.innerText = cnt;
}

button.addEventListener("click", clickHandler);