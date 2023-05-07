
// form tag의 submit을 감지하기위해 선택한 html element.
const loginForm = document.querySelector("#login-form");
const loginInput = document.querySelector("#login-form input");

// 모든 eventListener의 first argument는 항상 지금 막 벌어진 일들에 대한 정보이다.
// JavaScript의 이벤트 핸들러 함수에는 기본적으로 전달되는 하나의 매개변수가 있다. 
// 이 매개변수는 지금 막 벌어진 이벤트와 관련된 정보를 제공하는 이벤트 객체(Event object)이다. 
// 이벤트 객체는 이벤트 유형에 따라 다양한 프로퍼티와 메서드를 가지고 있다.
// 예를 들어, 마우스 클릭 이벤트의 경우 event 객체는 클릭한 버튼의 정보, 클릭된 요소의 정보, 클릭 위치 등을 제공한다.

function onLoginSubmit(event) {
	const username = loginInput.value;
	console.log("hello, " + username);

	event.preventDefault();
	console.log(event);
}

loginForm.addEventListener("submit", onLoginSubmit);