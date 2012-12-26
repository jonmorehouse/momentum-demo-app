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

			general :

				bottomOffset : 20 #how far from the bottom the balls will be located
				horizontalOffset : 20 #how far from the left and right borders the balls will be located!

		constructor : (canvas) ->


			# initialize paperjs window
			@canvas = canvas
			@paper = new paper.PaperScope()
			@paper.setup @canvas

			@settings = 

				height: @paper.view.size.height
				width: @paper.view.size.width


			# initialize data
			@elements = {}

			@paper.view.draw()
			@eventDelegator()



		reset : () =>

			# 1.) initialize buttons / reset them if they already exist!
			# 2.) reset the velocity buttons!
			# 3.) velocity and mass will be controlled from the control modules, when we run the objects, we will return those!
			
			# initialize helper x / y variables for this section
			_y = @settings.height - globalConfig.general.bottomOffset
			_x = globalConfig.general.horizontalOffset

			# create the two circles needed
			elements.a = new @paper.Path.Circle new @paper.Point(_x, _y), globalConfig.a.radius
			elements.b = new @paper.Path.Circle new @paper.Point(@settings.width - _x, _y), globalConfig.b.radius

			# initialize base controllers after this!
			



		runAnimation : () =>


			# this is the section that will responsible for running the animation for this module
			# responsible for getting the data from the controllers for each element and then running the animations!

		eventDelegator : () =>

			# @tool.fixedDistance = @velocityButton.settings.dragLength
			triangle = new @paper.Path.RegularPolygon new @paper.Point(100, 100), 3, 4
			triangle.strokeColor = "blue"



		
