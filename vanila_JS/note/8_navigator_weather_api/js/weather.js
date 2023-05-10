const API_KEY = "e55a777df171ea2b31d0ba74790854bf";

function geoSuccess(position) {
	const lat = position.coords.latitude;
	const lng = position.coords.longitude;
	const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&appid=${API_KEY}&units=metric`;
	// console.log(url);
	fetch(url)
		.then(response => response.json())
		.then(data => {
		// console.log(data)
		const city = data.name;
		const wet = data.weather[0].main;
		const temperature = data.main.temp;

		document.querySelector("#weather span:nth-child(1)").innerText = city;
		document.querySelector("#weather span:nth-child(2)").innerText = `${wet} / ${temperature}C`;
		});
	
}

function getError() {
	alert("Can't find you. No weather for you.");
}

navigator.geolocation.getCurrentPosition(geoSuccess, getError);

 