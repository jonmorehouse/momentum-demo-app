# Base Ball Module

# responsible for handling the ball before animation
# will hold the ball and its attributes etc
# when the animation is run, we will actually use it on the element in the base_module
# after the animation is run, we reset completely!
# on click we need to change the value of the velocity -- this can be later functionality

define ["paper"], (paper) ->

	class Ball

		constructor : (paper, options) ->

			@config =

				radius: 30
				color: "brown"
				mass: 10
				velocity: 10
				verticalOffset: 70
				horizontalOffset: 50
				left : true

			@paper = paper
			
			# set the default settings in this class
			@settings =

				height: @paper.view.size.height
				width: @paper.view.size.width

			# for each element, set the global config for this!
			for key, value of options
				@config[key] = value

			@init() #actually initialize the element	
			@click()


		# initialize the element
		init : () =>

			# responsible for initializing the element
			@position = {}

			# initialize x position depending upon left or not
			_x = if @config.left then @config.horizontalOffset else @settings.width - @config.horizontalOffset

			# initialize
			@position.original = new @paper.Point _x, @settings.height - @config.verticalOffset
			@position.current = @position.original

			# now initialize the actual element!
			@element = new @paper.Path.Circle @position.original, @config.radius
			@element.fillColor = @config.color

		click : () =>

			@element.attach "mouseclick", (event) =>

				console.log "mouse enter area function"				

				alert "hello world"



		# reset the position only, between runs only!
		positionReset : () =>

			# useful when we just are finished running the animation
			@element.position.x = @position.original.x
			@element.position.y = @position.original.y

		# resets the entire elements's attributes and repositions it
		fullReset : () =>

			# reset velocity, mass etc
			@position.positionReset()
			@attributes.velocity = @config.velocity
			@attributes.mass = @config.mass


		# called from outside modules that need to access the module
		setVelocity : (velocity) =>

			@config.velocity = velocity

		# called from outside modules to change mass!
		setMass : (mass) =>

			@config.mass = mass

		setPosition : (position) =>

			@position.current = position

		# return the current velocity for animation run in the elements!
		getVelocity : () =>

			# returns current velocity
			return @config.velocity

		# return the mass
		getMass : () =>

			return @config.mass

