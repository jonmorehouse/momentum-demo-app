define [] , () ->

	class VelocityButton 

		# class variables
		settings = 

			# general elements
			general : 

				bottomOffset : 20
				rightOffset : 20

			style :

				strokeColor : "black"
				strokeWidth : 2.5
				fillColor : "black"

			tip :

				accuracy: 20
				radius : 8
				position : 0

			tail :

				rightOffset : 20
				width: 4
				segments : 10
				minLength : 5
				maxLength: 20

		constructor : (paper, _settings) -> #where settings is a paper instance and settings is a variable

			@test = "55"
			@paper = paper

			@tool = new @paper.Tool()

			# object variables
			@settings = 

				dragLength : settings.tail.minLength
				type : "a"
				height : @paper.view.size.height
				width : @paper.view.size.width

				tip :

					center : undefined

				tail :

					length : (settings.tail.minLength + settings.tail.maxLength) * 0.5

			# initialize objects
			@shapeInit()


		drag : (event) ->

			# check if collision
			# drag the element a certain number of elements

			alert "hello world"				
				


		shapeInit : () ->

			# initialize tail
			@tail = new @paper.Path()

			# general y element
			_y = @settings.height - settings.general.bottomOffset - (settings.tail.width * 1.5)

			for i in [0..settings.tail.segments]
				
				_x = @settings.width - (i * @settings.tail.length + settings.general.rightOffset)
				@tail.add(new @paper.Point _x, _y)

			@tail.style = settings.style
			@tail.strokeWidth = settings.tail.width

			# initialize triangle
			_y = @settings.height - settings.general.bottomOffset - (settings.tip.radius * 0.5)
			_x = @settings.width - settings.general.rightOffset - (settings.tail.segments * @settings.tail.length) 
			@settings.tip.center = new @paper.Point _x, _y

			@tip = new @paper.Path.RegularPolygon @settings.tip.center, 3, settings.tip.radius

			# initialize style and rotation
			@tip.style = settings.style
			@tip.rotate = (if @settings.type == "a" then -90 else 90)


			