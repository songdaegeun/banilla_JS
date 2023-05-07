const h1 = document.querySelector(".hello h1:first-child")
console.dir(h1);

function click_handler() {

    console.log("clicked");
}
function mouse_enter_handler() {
    h1.innerText = "here is mouse!";
}
function mouse_leave_handler() {
    h1.innerText = "grab me!";
}
function handle_window_resize() {
    document.body.style.backgroundColor = "tomato";
}
function handle_window_copy() {
    alert("카피하지마라!");
}
function handle_window_offline() {
    alert("offline!");
}
function handle_window_online() {
    alert("online!");
}

// h1.addEventListener("click", click_handler);
h1.onclick = click_handler;
// h1.addEventListener("mouseenter", mouse_enter_handler);=
h1.onmouseenter = mouse_enter_handler;
h1.addEventListener("mouseleave", mouse_leave_handler);
// h1.onmouseleave = mouse_leave_handler;


// window 객체에 대해 작동.
window.addEventListener("resize", handle_window_resize);
window.addEventListener("copy", handle_window_copy);

//네트워크 연결 이벤트
window.addEventListener("offline", handle_window_offline);
window.addEventListener("online", handle_window_online);
