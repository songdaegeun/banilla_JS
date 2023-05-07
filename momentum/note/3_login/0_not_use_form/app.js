// user에게 이름을 물어본다.
// 이름 정보를 받는다.
// 받은 이름 정보를 화면에 출력한다.
const loginInput = document.querySelector("#login-form input");
const loginButton = document.querySelector("#login-form button");

// input값을 얻는다.
// button에 onclick일때 console.log([input값])을 한다.

function handleClick() {
	const username = loginInput.value;
	// username validity check.
	if(username === "") {
		alert("please write your name.");
	} else if(username.length > 15) {
		alert("your name is too long.");
	}
	else {
		console.log("hello, " + username);
	}
}

loginButton.addEventListener("click", handleClick); 