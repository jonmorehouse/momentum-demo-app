# Module functions

# this module serves as the controller for this animation
# need to resize the balls on mass change

define ['paper', 'ball', 'frame', 'velocity_button', ], (paper, ball, frame, VelocityButton) ->

	class BaseModule

		# static variables -- also equal to using @ or this
		triggerReset = () -> return false #parent attached function which will allow us to work on parent
		triggerChange = () -> return false #these are the parent attached nodes
				
		elementSettings : 

			a :
				color : "red"
				velocity : 10
				mass: 3
				radius: 20
				left: true

			b : 
				color : "blue"
				velocity : 10
				mass: 5
				radius: 30
				left : false

			frame: 
				velocity: 2

		constructor : (canvas, options) -> #send in options -- ie: height / width!

			# initialize paperjs library
			@canvas = canvas
			@paper = new paper.PaperScope()
			@tool = new @paper.Tool()
			@paper.setup @canvas
			@view = new @paper.View(canvas)


			@elements =

				a : new ball @paper, @elementSettings.a
				b : new ball @paper, @elementSettings.b
				frame : new frame @paper, @elementSettings.frame

			@paper.view.draw()

			@eventDelegator()

		eventDelegator : () =>

			@view.draw = () =>

				# what goes in here? 
				# without, keep getting an error function
				# console.log "draw function"

			@tool.onMouseDown = () =>

				@animate()



		animate : () ->


			left = @elements.a
			right = @elements.b
			counter = 0


			delta_x = right.position.current.x - left.position.current.x

			# run animation -- map the refresh to 1 pixel per second!
			# assume velocity is the delta_x
			iterations = 0
			ld = 1
			rd = -1

			run = () =>



				if left.element.position.x > @view.size.width
					ld *= -1
				if left.element.position.x < 0
					ld *= -1
				if right.element.position.x < 0
					rd *= -1

				if right.element.position.x > @view.size.width
					rd *= -1

				left.element.position.x += ld * left.getVelocity()
				right.element.position.x += rd * right.getVelocity()



				@paper.view.draw()
				if delta_x > 0

					return setTimeout run, 10

			run()







