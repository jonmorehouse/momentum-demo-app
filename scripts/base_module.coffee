# Module functions

# this module serves as the controller for this animation
# need to resize the balls on mass change

define ['paper', 'velocity_button'], (paper, velocity_button) ->


	class BaseModule

		triggerReset = undefined
		triggerChange = undefined 


		globalConfig = 

			a :
				radius: 10
				color: "brown"
				mass: 10
				velocity: 10

			b :
				radius: 5
				color: "blue"
				mass: 8
				velocity: 8

			frame :

				velocity: 0


		constructor : (canvas) ->

			# initialize paperjs window
			@canvas = canvas
			@paper = new paper.PaperScope()
			@paper.setup @canvas
			@tool = new @paper.Tool()

			_point = new @paper.Point 10, 10
			# initialize data
			@elements =

				a : new @paper.Path.Circle _point, 20 #initialize base circles on the screen

				# b : new @paper.Path.Circle globalConfig.b.radius, 20

			@elements.a.fillColor = globalConfig.a.color

			velocity_button = new VelocityButton @paper

			@paper.view.draw()




		animation : () ->


			tL = new @paper.Point 40, 40
			size = new @paper.Size 30, 30
			path = new @paper.Path.Rectangle tL, size

			path.strokeColor = "blue"
			path.fillColor = "blue"




			@paper.view.onFrame = (event) ->

				path.rotate 3


			@paper.view.draw()




		
