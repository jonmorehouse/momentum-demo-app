define ["paper"], (paper) ->


	class Frame

		constructor : (@paper, @container, options) ->

			@config = []

			for key, value of options

				@config[key] = value

			@tag = @container.find "span:nth-child(2)"

 
		getVelocity : () =>

			return @config.velocity

		setVelocity : (velocity) =>

			@config.velocity = velocity
			@tag.text velocity





