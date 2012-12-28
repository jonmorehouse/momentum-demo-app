# Base Ball Module

# responsible for handling the ball before animation
# will hold the ball and its attributes etc
# when the animation is run, we will actually use it on the element in the base_module
# after the animation is run, we reset completely!
# on click we need to change the value of the velocity -- this can be later functionality

define ["paper"], (paper) ->

	class Ball

		constructor : (paper, options) ->

			@paper = paper

			@config =

				radiusFactor: 6
				verticalOffset: 100
				horizontalOffset: 10
				left : true
				maxHeight : @paper.view.size.height
				maxWidth : @paper.view.size.width

			# for each element, set the global config for this!
			@config.mass = options.mass
			@config.velocity = options.velocity

			@setVelocity @config.velocity
			@setMass @config.mass
			@config.left = options.left
			@config.color = options.color


			@elementInit() #actually draw the element

			@setMass 5
			# end constructor function

		elementInit : () =>

			# initialize x / y functions!
			_x = if @config.left then @config.horizontalOffset + @radius else @config.maxWidth - @config.horizontalOffset - @radius
			_y = @config.maxHeight - @config.verticalOffset - @radius

			# initialize the original element
			@original = new @paper.Point _x, _y

			if @element
				@element.remove()

			# can make this a layer in the future! -- to incorporate animations in the objects for more excitement!
			@circle = new @paper.Path.Circle @original, @radius
			@text = new @paper.PointText new @paper.Point @original.x, @original.y + 4
			@element = new @paper.Layer([@circle, @text])

			# initialize the ball style!
			@circle.fillColor = @config.color
			@circle.smooth()

			# initialize text
			@text.justification = "center"
			@text.fillColor = "white"
			@text.content = @getMass() + "kg"

			# draw the element
			@paper.view.draw()

		# reset the position only, between runs only!
		positionReset : () =>

			# useful when we just are finished running the animation
			@element.position.x = @original.x
			@element.position.y = @original.y

		# resets the entire elements's attributes and repositions it
		fullReset : () =>

			# reset velocity, mass etc
			@positionReset()
			@setVelocity @config.velocity
			@setMass @config.mass #set the mass and radius!
			@elementInit() #initialize the element


		# called from outside modules that need to access the module
		setVelocity : (velocity) =>

			@velocity = velocity

		# called from outside modules to change mass!
		setMass : (mass) =>

			@config.mass = mass
			@mass = mass
			@radius = @mass * @config.radiusFactor
			@elementInit()


		# return the current velocity for animation run in the elements!
		getVelocity : () =>

			# returns current velocity
			return @velocity

		# return the mass
		getMass : () =>

			return @mass

