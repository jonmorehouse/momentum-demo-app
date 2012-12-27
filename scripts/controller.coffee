# Module goals:
	
# 	1.) responsible for setting and initializing all modules
# 	2.) attach handlers. This needs a global reset element -- calls reset on each one!
# 	3.) change frame, a and b elements here. An element that can be called from any class and then from the jquery elements
#	4.) loads in the animations automatically for the elements with animation module!

define ["base_module", "animation"], (baseModule, animation) ->

	# html elements!
	elements = #base elemnets!

		"lab" : $('#container > div:nth-child(1)') 
		"red" : $('#container > div:nth-child(2)') 
		"blue" : $('#container > div:nth-child(3)')
		"custom" : $('#container > div:nth-child(4)')

	elementData = #this is custom data that will over-write the modules!

		lab : #frame of reference from the laboratory
			a : 
				velocity: 5
				mass: 3

			b :

				velocity: -1
				mass: 5

			frame: 
				velocity: 0

		red: #frame of reference of the red ball
			a :
				mass: 3
				velocity: 0
			b:
				mass: 5
				velocity: -6
			frame:
				velocity: 0

		blue:#frame of reference from the blue ball
			a:
				mass: 3
				velocity: 6
			b:
				mass: 5
				velocity: 0

			frame:

				velocity: -1

		custom: #custom frame of reference

			a:
				mass: 3
				velocity: 3


			b:
				mass: 5
				velocity: -3

			frame:
				velocity: 2

	modules = 	#create a base module for each and then send it callback functions etc for changing ...

		lab : new baseModule elements.lab.children("canvas")[0], elementData.lab
		red : new baseModule elements.red.children("canvas")[0], elementData.red
		blue : new baseModule elements.blue.children("canvas")[0], elementData.blue
		custom : new baseModule elements.custom.children("canvas")[0], elementData.custom

	handlers = () ->

		# will attach a handler for each element to map the proper sliders etc



