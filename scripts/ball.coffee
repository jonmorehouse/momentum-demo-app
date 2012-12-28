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

			@config.left = options.left
			@config.color = options.color
			@velocity = options.velocity
			@config.mass = options.mass
			@mass = options.mass
			@radius = @mass * @config.radiusFactor

			# initialze the element
			@init()
			# end constructor function

		init : () =>

			# initialize x / y functions!
			_x = if @config.left then @config.horizontalOffset + @radius else @config.maxWidth - @config.horizontalOffset - @radius
			_y = @config.maxHeight - @config.verticalOffset - @radius

			# initialize the original element
			@original = new @paper.Point _x, _y

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


		attrReset : (oldRadius) =>

			# initialize the radius
			# update the text element etc
			@text.content = @getMass() + "kg"

			# reset the radius of the circle
			@circle.scale @radius / oldRadius

			# recreate the coordinates for this item
			@original.x = if @config.left then @config.horizontalOffset + @radius else @config.maxWidth - @config.horizontalOffset - @radius
			@original.y = @config.maxHeight - @config.verticalOffset - @radius

			# actually move the elmeent
			@element.position.x = @original.x
			@element.position.y = @original.y

			# update the view
			@paper.view.draw()

		# reset the position only, between runs only!
		positionReset : () =>

			# useful when we just are finished running the animation
			@element.position.x = @original.x
			@element.position.y = @original.y

			@paper.view.draw()

		# resets the entire elements's attributes and repositions it
		fullReset : () =>

			# reset velocity, mass etc
			@setVelocity @config.velocity
			@setMass @config.mass #set the mass and radius!


		# called from outside modules that need to access the module
		setVelocity : (velocity) =>

			@velocity = velocity

		# called from outside modules to change mass!
		setMass : (mass) =>

			@config.mass = mass
			@mass = mass
			oldRadius = @radius
			@radius = @mass * @config.radiusFactor

			# initialize the 
			@attrReset(oldRadius)

		# return the current velocity for animation run in the elements!
		getVelocity : () =>

			# returns current velocity
			return @velocity

		# return the mass
		getMass : () =>

			return @mass

