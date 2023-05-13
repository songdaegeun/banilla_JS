var key = Symbol('symbol key');

const obj = {};
obj[key] = 'value';
obj["key2"] = 'value2';
obj["key3"] = 'value3';

// console.log(obj[key]); // value

for(let i in obj) {
	console.log(i);
}

console.log(Object.getOwnPropertyNames(obj));
console.log(Object.getOwnPropertySymbols(obj));
console.log(function(){})