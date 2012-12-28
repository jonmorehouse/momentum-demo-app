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

			run = () =>

				# cache velocities etc for quick local access
				lv = left.getVelocity()
				lm = left.getMass()

				rv = right.getVelocity()
				rm = right.getMass()

				fv = frame.getVelocity()

				# validate both red and blue balls
				do leftStatus = () =>
					
					reset = () =>

						leftRunning = false
						left.positionReset()
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
								
						else if parseInt(left.element.position.x) < parseInt(left.original.x)
							do reset

						else if parseInt(left.element.position.x) > @paper.view.size.width
							do reset

						else
							do move
						
						@paper.view.draw()

				do rightStatus = () =>

					reset = () =>

						rightRunning = false
						right.positionReset()
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

						else if parseInt(right.element.position.x) > parseInt(right.original.x)	
							do reset

						else if right.element.position.x < 0
							do reset

						else
							do move

						# refresh the scene if still running
						@paper.view.draw()

				collisionResponse = () =>

					lm = do left.getMass
					rm = do right.getMass

					lfv = ((lv * (lm - rm)) + (2 * rm * rv)) / (lm + rm)
					rfv = ((rv * (rm - lm)) + (2*lm*lv)) / (lm + rm)

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

					@paper.view.draw()
					@playing = false
			# END RUN METHOD

			# handle the play call!
			if not @playing
				@playing = true
				do run #run the element
		# END PLAY METHOD







