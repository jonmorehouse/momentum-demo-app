define ["paper"], (paper) ->


	class Frame

		constructor : (@paper, @container, options) ->

			@config = []

			for key, value of options

				@config[key] = value

			@tag = @container.find "span:nth-child(2)"
			@input = @container.find "input"

 
		getVelocity : () =>

			return @config.velocity

		setVelocity : (velocity) =>

			@config.velocity = parseInt velocity
			@tag.html @config.velocity

			label = if @config.velocity < 0 then @config.velocity * -1 else @config.velocity

			@input.attr "value", label + 10



