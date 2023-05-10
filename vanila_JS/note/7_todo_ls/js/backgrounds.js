const image = [
	"0.webp",
	"1.webp",
	"2.jpg",
]

const bgImage = document.createElement("img");
const chosenImage = image[Math.floor(Math.random() * image.length)];

bgImage.src = `img/${chosenImage}`;
document.body.appendChild(bgImage);