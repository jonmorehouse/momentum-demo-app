# Module functions

# this module serves as the controller for this animation
# need to resize the balls on mass change

define ['paper', 'velocity_button'], (paper, VelocityButton) ->


	class BaseModule

		# static variables -- also equal to using @ or this
		triggerReset = () -> return false #parent attached function which will allow us to work on parent
		triggerChange = () -> return false #these are the parent attached nodes
		

			frame :
				velocity: 0

			general :

				bottomOffset : 20 #how far from the bottom the balls will be located
				horizontalOffset : 20 #how far from the left and right borders the balls will be located!

		constructor : (canvas) ->


			# initialize paperjs window
			@canvas = canvas #make canvas global in this object
			@paper = new paper.PaperScope() #create a new instance of the paperjs library
			@tool = new @paper.Tool() #create a listener tool
			@view = new @paper.View(@canvas) #new view for this current window!
			@paper.setup @canvas #install paper js on the current canvas element

			@settings = 

				height: @view.size.height
				width: @view.size.width

			#initialize ball modules!
			@init()
			@reset()

			# @view.draw()
			@eventDelegator()#



		init : () =>

			# 1.) initialize buttons / reset them if they already exist!
			# 2.) reset the velocity buttons!
			# 3.) velocity and mass will be controlled from the control modules, when we run the objects, we will return those!
							
			@elements = {} #initialize the elements

			# initialize helper x / y variables for this section
			_y = @settings.height - globalConfig.general.bottomOffset
			_x = globalConfig.general.horizontalOffset

			# initialize element data! 
			@elements =
					
				a:
					defaultPosition : new @paper.Point _x, _y
					currentPosition : new @paper.Point _x, _y

				b: 
					defaultPosition : new @paper.Point @settings.width - _x, _y
					defaultPosition : new @paper.Point @settings.width - _x, _y

			@elements.a.element

			element : new @paper.Path.Circle new @paper.Point(@settings.width - _x, _y), globalConfig.b.radius

			# initialize base controllers after this!

			# initialize base styling for these elements!
			@elements.a.fillColor = globalConfig.a.color
			@elements.b.fillColor = globalConfig.b.color

		reset : (full = false) =>

			# responsible for repositioning the elements
			# responsible for calling reset on the velocity modules etc

			

		runAnimation : () =>


			# this is the section that will responsible for running the animation for this module
			# responsible for getting the data from the controllers for each element and then running the animations!

		eventDelegator : () =>

			@view.onResize = (event) => #call reset on this object!

				@reset()


			@view.draw = (event) =>

				


			@tool.onMouseDown = (event) =>

				console.log "hello world"
								


		
