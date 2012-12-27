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

		constructor : (canvas) ->

			# initialize paperjs library
			@canvas = canvas
			@paper = new paper.PaperScope()
			@tool = new @paper.Tool()
			@paper.setup @canvas

			# initialize elements!
			@elements =

				a : new ball @paper, @elementSettings.a
				b : new ball @paper, @elementSettings.b
				frame : new frame @paper, @elementSettings.frame

			@paper.view.draw()
			

