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

				radius : 8
				position : 0

			tail :

				rightOffset : 20
				width: 4
				segments : 10
				minLength : 5
				maxLength: 20

		constructor : (paper, _settings) -> #where settings is a paper instance and settings is a variable

			@paper = paper

			@tool = new @paper.Tool()

			# object variables
			@settings = 

				type : "a"
				height : @paper.view.size.height
				width : @paper.view.size.width

				tail :

					length : (settings.tail.minLength + settings.tail.maxLength) * 0.5

			# initialize objects
			@shapeInit()

		drag : (event) ->

			alert "hello wr"
			console.log "hello world from range!"




		

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
			@tip = new @paper.Path.RegularPolygon new @paper.Point(_x,_y), 3, settings.tip.radius

			# initialize style and rotation
			@tip.style = settings.style
			@tip.rotate (if @settings.type == "a" then -90 else 90)










