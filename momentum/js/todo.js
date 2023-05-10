const todoForm = document.querySelector("#todo-form");
const todoList = document.querySelector("#todo-list");
const todoInput = todoForm.querySelector("input:first-child");

function deleteTodo(evnet) {
	const li = event.target.parentElement;
	todoList.removeChild(li);
	// li.remove();
}

function paintTodo(newTodo) {
	const li = document.createElement("li");
	const span = document.createElement("span");
	span.innerText = newTodo;
	const button = document.createElement("button");
	button.innerText = '❌';

	li.appendChild(span);
	li.appendChild(button);
	
	button.addEventListener("click", deleteTodo);
	todoList.appendChild(li);
}

function submitHandler(event) {
	event.preventDefault();
	const newTodo = todoInput.value;
	todoInput.value = "";
	paintTodo(newTodo);
	localStorage.setItem("newtodo", newTodo);
}

todoForm.addEventListener("submit", submitHandler);
