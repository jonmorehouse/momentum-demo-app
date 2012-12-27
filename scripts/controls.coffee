define ["paper"], (paper) ->

	class Control	

		config =

			radius: 20
			playColor : "blue"
			pauseColor : "red"
			backgroundColor: "black"
			verticalOffset: 10

		constructor : (paper, callback) ->

			@paper = paper
			@callback = callback


			@init()

			@paper.view.draw()
		
		init : () ->

			center = new @paper.Point @paper.view.size.width * 0.5, @paper.view.size.height - config.verticalOffset

			@circle = new @paper.Path.Circle center, 20
			@circle.fillColor = "black"
			# responsible for creating the play button, 

		reset : () ->

			#responsible for showing the play button again!



