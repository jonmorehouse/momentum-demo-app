define ["jquery"], ($) -> #include our extension!
	
	# basic easing function instead of including library!

	$.easing.general = (x, t, b, c, d) -> 

			if ((t/=d) < (1/2.75))
				return c*(7.5625*t*t) + b
			
			else if (t < (2/2.75))
				return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b

			else if (t < (2.5/2.75))
				return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b

			else
				return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b


	class ToggleController

		config :

			animationTime : 1000 #how long the animation will run for
			visible : true #open by default!


		constructor : (trigger, container) ->

			@container = container

			$(trigger).click () =>

				if @config.visible
					@hide()

				else
					@show()
		
		show : () =>

			@container.slideDown @config.animationTime, "general", () =>

				@config.visible = true

		hide : () =>

			@container.slideUp @config.animationTime, "general", () =>

				@config.visible = false



	controllers = []

	# we want to initialize classes below!
	$('#container').children("div").each () ->

		element = $(this)

		trigger = element.find(".exit")
		container = element.children(".content")

		controllers.push new ToggleController trigger, container













	




