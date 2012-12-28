# Module functions

# this module serves as the controller for this animation
# need to resize the balls on mass change

define ['paper', 'ball', 'frame'], (paper, ball, frame) ->

	class BaseModule
				
		constructor : (canvas, options) -> #send in options -- ie: height / width!

			# initialize paperjs library
			@canvas = canvas
			@paper = new paper.PaperScope()
			@tool = new @paper.Tool()
			@paper.setup @canvas
			@view = new @paper.View(canvas)
			@options = options

			@view.draw = () ->

				console.log "what goes in the draw?"

			# element data initializing 
			@elements =

				a : new ball @paper, @options.a
				b : new ball @paper, @options.b
				frame : new frame @paper, @options.frame

			# paper view
			@playing = false
			@paper.view.draw()

		play : () =>

			# initialize references to the proper objects
			left = @elements.a
			right = @elements.b
			frame = @elements.frame

			# initialize our running variables
			collision = false #whether or not a collision has occurred
			rightRunning = true
			leftRunning = true

			do run = () =>

				





		oldPlay : () =>

			
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

				# initialize the playing element
				playing = true
				# initialize velocitys for each
				vr = right.getVelocity()
				vl = left.getVelocity()
				fv = frame.getVelocity()

				# move each initial element! if they are running!
				if leftRunning and vl != 0
					
					left.element.position.x += vl + fv

				if rightRunning and vr != 0

					right.element.position.x += vr + fv

				# if a collision checks, need to reverse the elements!
				if not collision and left.element.position.x + left.radius >= right.element.position.x - right.radius

					collision = true
					# cache both masses
					ml = left.getMass()
					mr = right.getMass()

					# calculate new velocities
					vlf = ((vl * (ml - mr)) + (2 * mr * vr)) / (ml + mr)
					vrf = ((vr * (mr - ml)) + (2*ml*vl)) / (ml + mr)

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

				else # animation is done playing
					@playing = false



			if not @playing #play the elemnet
				run()









