# Module goals:
	
# 	1.) responsible for setting and initializing all modules
# 	2.) attach handlers. This needs a global reset element -- calls reset on each one!
# 	3.) change frame, a and b elements here. An element that can be called from any class and then from the jquery elements
#	4.) loads in the animations automatically for the elements with animation module!

define ["base_module", "animation"], (base_module, animation) ->

	elements =

		0 : $('#container > div:nth-child(1)') 

	# modules


	controller = () ->	#create a base module for each and then send it callback functions etc for changing ...

		first = new base_module elements[0].children("canvas")[0]

			



