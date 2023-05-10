const clock = document.querySelector("h2#clock");


function updateClock() {
	const date = new Date();
	clock.innerText = `${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}`;
}

updateClock();
setInterval(updateClock, 1000); // 1000ms주기로 handler실행.
// setTimeout(updateClock, 1000); 1000ms지나면 handler실행.
