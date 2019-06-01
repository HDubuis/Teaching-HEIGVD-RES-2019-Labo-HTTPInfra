var Chance = require("chance");
var chance = new Chance();

var express = require("express");
var app = express()

app.get('/', function(req, res) {
	res.send(generateAnimals());
});

app.get('/test', function(req, res) {
	res.send('Hello TEST!');
});

app.listen(3000,function(){
	console.log("Listen HTTp request to port 3000");
});

function generateAnimals(){
	var animalTypes = new Array("ocean", "desert", "grassland", "forest", "farm", "pet", "zoo");
	var numberOfAnimals = chance.integer({
		min: 0,
		max: 15
	});
	console.log(numberOfAnimals);
	var animalType = chance.integer({
		min: 0,
		max: 6
	});
	var animals = [];
	for(var i = 0; i < numberOfAnimals; i++){
		animals.push({
			animal: chance.animal({
				type: animalTypes[animalType]
			})
		});
	};
	console.log(animals);
	return animals; 
}