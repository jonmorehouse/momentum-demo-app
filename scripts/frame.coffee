define ["paper"], (paper) ->


	class Frame

		config :

			editable : false
			verticalOffset: 20
			horizontalOffset: 20


		constructor = (canvas, options) ->


			@canvas = canvas #initialize canvas for this object!
			@paper = new paper.PaperScope() #initialize a new paperscope on this element
			@tool = new @paper.Tool() #used to listen on click for when we can edit the element!
			@view = new @paper.View(@canvas)

			for i in options #should only be editable and default value!

				@config[i] = options[i]

			@init()


		init = () =>

			@origin = new @paper.Point @config.verticalOffset, @config.horizontalOffset

			@element = new @paper.Circle @origin, 20
			@element.fillColor = "orange"








