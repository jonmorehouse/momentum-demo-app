# Module functions

# this module serves as the controller for this animation
# need to resize the balls on mass change

define ['paper', 'velocity_button'], (paper, VelocityButton) ->


	class BaseModule

		# static variables -- also equal to using @ or this
		triggerReset = () -> return false #parent attached function which will allow us to work on parent
		triggerChange = () -> return false #these are the parent attached nodes

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
			@test = " hello world"
			@canvas = canvas
			@paper = new paper.PaperScope()
			@paper.setup @canvas
			# @tool = new @paper.Tool()

			_point = new @paper.Point 10, 10

			# initialize data
			@elements =

				a : new @paper.Path.Circle _point, 20 #initialize base circles on the screen

				# b : new @paper.Path.Circle globalConfig.b.radius, 20

			@elements.a.fillColor = globalConfig.a.color


			# initialize velocity button
			@velocityButton = new VelocityButton @paper, type: "a"


			@paper.view.draw()
			@eventDelegator()

		eventDelegator : () =>

			# @tool.fixedDistance = @velocityButton.settings.dragLength
			triangle = new @paper.Path.RegularPolygon new @paper.Point(100, 100), 3, 4
			triangle.strokeColor = "blue"

			triangle.attach "mouseenter", () ->

				alert " hello world"

			@velocityButton.tip.attach "mouseenter", () ->

				alert "hello"


		animation : () =>


			tL = new @paper.Point 40, 40
			size = new @paper.Size 30, 30
			path = new @paper.Path.Rectangle tL, size

			path.strokeColor = "blue"
			path.fillColor = "blue"


			path.attach "mouseenter", (event) ->

				console.log event

			path.attach "mousedrag", (event) -> 

				console.log "hello"

			@paper.view.onFrame = (event) ->

				path.rotate 3


			@paper.view.draw()






		
