const todoForm = document.querySelector("#todo-form");
const todoList = document.querySelector("#todo-list");
const todoInput = todoForm.querySelector("input:first-child");
let toDos = [];

const TODOS_KEY = "todos";

function saveTodos() {
	localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
}


function deleteTodo(event) {
	const li = event.target.parentElement;
	todoList.removeChild(li);
	// li.remove();
	toDos = toDos.filter((item) => item.id !== parseInt(li.id));
	saveTodos();
}

function paintTodo(newTodoObj) {
	const li = document.createElement("li");
	li.id = newTodoObj.id;
	const span = document.createElement("span");
	span.innerText = newTodoObj.text;
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
	
	const newTodoObj = {
		text:newTodo,
		id:Date.now(),
	} 
	paintTodo(newTodoObj);
	toDos.push(newTodoObj);
	saveTodos();
}

todoForm.addEventListener("submit", submitHandler);

const savedTodos = localStorage.getItem(TODOS_KEY);
if(savedTodos) {
	const parsedTodos = JSON.parse(savedTodos);
	toDos = parsedTodos;
	parsedTodos.forEach(paintTodo);
	// parsedTodos.forEach((item) => paintTodo(item));
}