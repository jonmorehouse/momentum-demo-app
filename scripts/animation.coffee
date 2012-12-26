define [], () -> #include our extension!

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

		easing : (x, t, b, c, d) -> 
				
			if ((t/=d) < (1/2.75))
				return c*(7.5625*t*t) + b
			
			else if (t < (2/2.75))
				return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b

			else if (t < (2.5/2.75))
				return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b

			else
				return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b
		
		show : () =>

			@container.slideDown @config.animationTime, @easing(), () =>

				@config.visible = true

		hide : () =>

			@container.slideUp @config.animationTime, @easing(), () =>

				@config.visible = false



	controllers = []

	# we want to initialize classes below!
	$('#container').children("div").each () ->

		element = $(this)

		trigger = element.find(".exit")
		container = element.children("canvas")

		controllers.push new ToggleController trigger, container













	




