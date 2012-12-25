define [] , () ->

	class VelocityButton 


		constructor : (paper, settings) -> #where settings is a paper instance and settings is a variable

			@paper = paper
			@settings = settings #ass
			@triangle = new @paper.Path.RegularPolygon new Point 80, 80 , 3, 50
			@triangle.fillColor = '#e9e9ff';
			@triangle.selected = true;

		reset : () ->

			alert "hello world"


