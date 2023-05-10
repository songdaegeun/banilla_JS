const clock = document.querySelector("h2#clock");

function updateClock() {
	const date = new Date(); 
	const hour = String(date.getHours()).padStart(2, "0"); 
	const min = String(date.getMinutes()).padStart(2, "0"); 
	const sec = String(date.getSeconds()).padStart(2, "0"); 
	
	clock.innerText = `${hour}:${min}:${sec}`;
	// clock.innerText = date.toLocaleTimeString();
}

updateClock();
setInterval(updateClock, 1000); // 1000ms주기로 handler실행.
