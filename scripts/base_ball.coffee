# Base Ball Module

# responsible for handling the ball before animation
# will hold the ball and its attributes etc
# when the animation is run, we will actually use it on the element in the base_module
# after the animation is run, we reset completely!

define ["paper"], (paper) ->

	class Ball

		config :

			radius: 10
			color: "brown"
			mass: 10
			velocity: 10
			verticalOffset: 20
			horizontalOffset: 20

		constructor = (canvas, options) ->

			@canvas = canvas
			@paper = new paper.PaperScope()
			@tool = new @paper.Tool()
			@view = new @paper.View(@canvas)

			# set the default settings in this class
			@settings =

				height: @view.size.height
				width: @view.size.width

			# for each element, set the global config for this!
			for i in options

				@config[i] = options[i]

			@init() #actually initialize the element	


		# initialize the element
		init = () =>

			# responsible for initializing the element
			@position = {}
			@position.original = new @paper.Point @settings.width - @config.horizontalOffset, @settings.height - @config.verticalOffset
			@position.current = @position.original

			# now initialize the actual element!
			@element = new @paper.Circle @position.original, @config.radius
			@element.fillColor = new @config.color

		# reset the position only, between runs only!
		positionReset = () =>

			# useful when we just are finished running the animation
			@element.moveTo @position.original

		# resets the entire elements's attributes and repositions it
		fullReset = () =>

			# reset velocity, mass etc
			@element.moveTo @position.original
			@attributes.velocity = @config.velocity
			@attributes.mass = @config.mass


		# called from outside modules that need to access the module
		setVelocity = (velocity) =>

			@config.velocity = velocity

		# called from outside modules to change mass!
		setMass = (mass) =>

			@config.mass = mass

		# return the current velocity for animation run in the elements!
		getVelocity = () =>

			# returns current velocity
			return @attributes.velocity

		# return the mass
		getMass = () =>

			return @attributes.mass

