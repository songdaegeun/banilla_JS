const image = [
	"0.webp",
	"1.webp",
	"2.jpg",
]

// const background = document.querySelector("");
const chosenImage = image[Math.floor(Math.random() * image.length)];
const bgImage = document.createElement("img");

bgImage.src = `img/${chosenImage}`;
document.body.appendChild(bgImage);