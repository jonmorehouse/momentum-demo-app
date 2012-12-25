# Module goals:
	
# 	1.) responsible for setting and initializing all modules
# 	2.) attach handlers. This needs a global reset element -- calls reset on each one!
# 	3.) change frame, a and b elements here. An element that can be called from any class and then from the jquery elements


define ["base_module"], (base_module) ->

	elements =

		0 : $('#container > div:nth-child(1)')

	# modules


	controller = () ->	

		test = new base_module elements[0].children("canvas")[0]

		test.animation()
		



