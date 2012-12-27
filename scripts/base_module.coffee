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
				velocity : 5
				mass: 3
				radius: 20
				left: true

			b : 
				color : "blue"
				velocity : -5
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
			frame = @elements.frame
			counter = 0

			# run animation -- map the refresh to 1 pixel per second!
			# assume velocity is the delta_x

			run = () =>

				running = true
				# initialize velocitys for each
				vr = right.getVelocity()
				vl = left.getVelocity()
				fv = frame.getVelocity()

				# move each initial element!
				left.element.position.x += vl + fv
				right.element.position.x += vr + fv

				# if a collision checks, need to reverse the elements!
				if not collision and left.element.position.x + left.config.radius >= right.element.position.x - right.config.radius 

					collision = true
					# cache both masses
					ml = left.getMass()
					mr = right.getMass()

					# now recalculate the animations
					vlf = vl * (ml - mr) + 2 * mr * vr * 1 / (ml + mr) #initialize final velocity with this function!
					vrf = vr * (mr - ml) + 2 * ml * vl * 1 / (ml + mr) #initialize final velocity!

					# now set the two final velocities
					left.setVelocity vlf
					right.setVelocity vrf

				# the animation is complete!
				if collision and left.element.position.x < left.position.original.x or collision and right.element.position.x > right.position.original.x
					
					running = false #the animation is complete!
					left.fullReset() #reset both position
					right.fullReset()
					


				@paper.view.draw()

				if running

					return setTimeout run, 10

			run()







