define ["paper"], (paper) ->


	class Frame

		constructor : (canvas, options) ->

			@config =

				editable : false
				verticalOffset: 20
				horizontalOffset: 20

			@canvas = canvas #initialize canvas for this object!
			@paper = new paper.PaperScope() #initialize a new paperscope on this element

			for key, value of options

				@config[key] = value
 
		getVelocity : () =>

			return @config.velocity

		setVelocity : (velocity) =>

			@config.velocity = velocity





