
// form tag의 submit을 감지하기위해 선택한 html element.
const loginForm = document.querySelector("#login-form");
const loginInput = document.querySelector("#login-form input");
const greeting = document.querySelector("#greeting");

const HIDDEN_CLASS_NAME = "hidden";
const USERNAME_KEY = "username";

function onLoginSubmit(event) {
	event.preventDefault();
	loginForm.classList.add(HIDDEN_CLASS_NAME);

	const username = loginInput.value;
	localStorage.setItem(USERNAME_KEY, username);

	paintingGreeting(username);
}
function paintingGreeting(username) {
	greeting.innerText = `hello, ${username}`;
	greeting.classList.remove(HIDDEN_CLASS_NAME);
}

const savedUsername = localStorage.getItem(USERNAME_KEY);
 
if(savedUsername === null) {
	// show the form
	loginForm.classList.remove(HIDDEN_CLASS_NAME);
	loginForm.addEventListener("submit", onLoginSubmit);
} else {
	// show the greeting
	paintingGreeting(savedUsername);
}