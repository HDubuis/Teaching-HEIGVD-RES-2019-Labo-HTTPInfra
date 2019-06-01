$(function(){
        console.log("Loading animals");
		
		function loadAnimals() {
			$.getJSON ("/api/animals/", function (animals){
				
				console.log(animals);
				var message = "No animal is here";
				if(animals.length > 0){
					message = "L'animal est : " + animals[0].animal;
				}
				$(".my-4_1").text(message);
			});
		};
		
		loadAnimals();
		setInterval(loadAnimals, 2000);
});