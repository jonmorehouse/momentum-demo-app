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
				mass: 5
				radius: 30
				left: true

			b : 
				color : "blue"
				velocity : -8
				mass: 5
				radius: 40
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
			collision = false
			rightRunning = true
			leftRunning = true

			run = () =>


				# initialize velocitys for each
				vr = right.getVelocity()
				vl = left.getVelocity()
				fv = frame.getVelocity()

				# move each initial element! if they are running!
				if leftRunning	
					
					left.element.position.x += vl + fv

				if rightRunning

					right.element.position.x += vr + fv


				# if a collision checks, need to reverse the elements!
				if not collision and left.element.position.x + left.config.radius >= right.element.position.x - right.config.radius 

					collision = true
					# cache both masses
					ml = left.getMass()
					mr = right.getMass()


					# now recalculate the animations
					bottom = 1 / (ml + mr)

					vlf = vl * (ml - mr) + 2 * mr * vr * bottom #initialize final velocity with this function!
					vrf = vr * (mr - ml) + 2 * ml * vl * bottom #initialize final velocity!

					# now set the two final velocities
					left.setVelocity vlf
					right.setVelocity vrf

				# validate left and right animation of objects
				if collision and left.element.position.x <= left.original.x 

					leftRunning = false
					left.fullReset()

				if collision and right.element.position.x <= left.original.x

					leftRunning = false
					right.fullReset()

				if collision and right.element.position.x >= right.original.x 

					rightRunning = false
					right.fullReset()

				if collision and left.element.position.x >= right.original.x

					rightRunning = false
					right.fullReset()

				# draw out element
				@paper.view.draw()

				if rightRunning or leftRunning

					return setTimeout run, 10

			run()






