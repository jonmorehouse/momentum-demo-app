# Module functions

# this module serves as the controller for this animation
# need to resize the balls on mass change

define ['paper', 'ball', 'frame'], (paper, ball, frame) ->

	class BaseModule
				
		constructor : (@container, @options) -> #send in options -- ie: height / width!

			# initialize paperjs library
			@paper = new paper.PaperScope()
			@canvas = @container.children("canvas")[0]
			@paper = new paper.PaperScope()
			@tool = new @paper.Tool()
			@paper.setup @canvas
			@view = new @paper.View(@canvas)

			@view.draw = () ->

				# should not be re-implemented

			# element data initializing 
			@elements =

				a : new ball @paper, @container.find(".red_velocity"), @options.a
				b : new ball @paper, @container.find(".blue_velocity"), @options.b
				frame : new frame @paper, @container.find(".frame_velocity"), @options.frame

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

			run = () =>
				# cache velocities etc for quick local access
				lv = left.getVelocity()
				lm = left.getMass()

				rv = right.getVelocity()
				rm = right.getMass()

				fv = frame.getVelocity()

				# constraints on the elements triggering an end of completion for the animation
				maxLeft = @paper.view.size.width * 0.05
				maxRight = @paper.view.size.width * 0.95

				# validate both red and blue balls
				do leftStatus = () =>
					
					# left ball is past the left screen 

					reset = () =>

						leftRunning = false
						left.velocityReset()

					move = () =>
						
						delta = lv + fv #maximum amount of change for this element
						current = left.element.position.x 
						collisionBound = right.element.position.x - right.radius #right ball's collision element

						if not collision and current + delta + left.radius > collisionBound
							left.element.position.x = collisionBound - left.radius

						else
							left.element.position.x += delta


					if leftRunning 

						if lv == 0 or lm == 0 or (lv + fv) == 0 
							do reset
								
						else if parseInt(left.element.position.x) > maxRight or parseInt(left.element.position.x) < maxLeft
							do reset

						else
							do move
						
						@paper.view.draw()

				do rightStatus = () =>

					reset = () =>

						rightRunning = false
						right.velocityReset()

					move = () =>

						maxDelta = right.getVelocity() + frame.getVelocity()
						current = right.element.position.x - right.radius
						collisionBound = left.element.position.x + left.radius


						if not collision and current + maxDelta < collisionBound
							right.element.position.x = collisionBound + right.radius

						else 
							right.element.position.x += maxDelta							

					if rightRunning
					
						if rv == 0 or rm == 0 or rv + fv == 0
							do reset

						else if right.element.position.x < maxLeft or right.element.position.x > maxRight
							do reset

						else
							do move

						# refresh the scene if still running
						@paper.view.draw()

				collisionResponse = () =>

					lm = do left.getMass
					rm = do right.getMass

					lfv = ((lv * (lm - rm)) + (2 * rm * rv)) / (lm + rm)

					rfv = ((rv * (rm - lm)) + (2* lm * lv)) / (lm + rm)

					left.setTempVelocity lfv
					right.setTempVelocity rfv

				# check collision status and respond if necessary
				do collisionStatus = () =>

					# check if collision even exists
					if collision 
						return

					# collision hasn't happened ... check values etc
					leftRight = left.element.position.x + left.radius
					rightLeft = right.element.position.x - right.radius

					if rightLeft <= leftRight

						# reset the positions etc of the elements
						# right.element.position.x = leftRight + right.radius
						@paper.view.draw()

						# handle the collision
						do collisionResponse #responsible for controlling the reset values etc after the collision
						collision = true

				# re-evaluate the animation status. Restart if necessary
				if leftRunning or rightRunning

					return setTimeout run, 10

				else 	
					right.positionReset()
					left.positionReset()
					@paper.view.draw()
					@playing = false
			# END RUN METHOD

			# handle the play call!
			if not @playing
				@playing = true
				do run #run the element
		# END PLAY METHOD







