# Module goals:
	
# 	1.) responsible for setting and initializing all modules
# 	2.) attach handlers. This needs a global reset element -- calls reset on each one!
# 	3.) change frame, a and b elements here. An element that can be called from any class and then from the jquery elements
#	4.) loads in the animations automatically for the elements with animation module!

define ["base_module", "animation"], (baseModule, animation) ->

	# html elements!
	parent = $('#container')

	parentElements = #base elemnets!


		"lab" : $('#container > div:nth-child(1) > .content') 
		"red" : $('#container > div:nth-child(2) > .content') 
		"blue" : $('#container > div:nth-child(3) > .content')
		"custom" : $('#container > div:nth-child(4) > .content')

	# initialize an object with all canvases pre-selected
	canvasElements = 

		"lab" : parentElements.lab.children "canvas"
		"red" : parentElements.red.children "canvas"
		"blue" : parentElements.blue.children "canvas"
		"custom" : parentElements.custom.children "canvas"

	# element data is responsible for each module's initial data. 
	elementData = #this is custom data that will over-write the modules!

		lab : #frame of reference from the laboratory

			name: "lab"
			a : 
				velocity: 5
				mass: 3
				color: "red"
				left: true

			b :

				velocity: -3
				mass: 5
				color: "blue"
				left: false

			frame: 
				velocity: 1

		red: #frame of reference of the red ball
			name : "red"
			a :
				mass: 3
				velocity: 0
				left: true
				color: "red"

			b:
				mass: 5
				velocity: -3
				color: "blue"
				left: false

			frame:
				velocity: 1

		blue:#frame of reference from the blue ball
			name: "blue"
			a:
				mass: 3
				velocity: 5
				color: "red"
				left: true

			b:
				mass: 5
				velocity: 0
				color: "blue"
				left: false

			frame:

				velocity: 1

		custom: #custom frame of reference

			name: "custom"
			a:
				mass: 3
				velocity: 5
				color: "red"
				left: true

			b:
				mass: 5
				velocity: -1
				color: "blue"
				left: false

			frame:
				velocity: 1

	modules = #create a base module for each and then send it callback functions etc for changing ...
		lab : new baseModule canvasElements.lab[0], elementData.lab
		red : new baseModule canvasElements.red[0], elementData.red
		blue : new baseModule canvasElements.blue[0], elementData.blue
		custom : new baseModule canvasElements.custom[0], elementData.custom

	do playListener = () ->

		# clean this up with : http://stackoverflow.com/questions/7613100/issue-with-coffeescript-comprehensions-and-closures
		parentElements.lab.find(".play").click () ->
			modules.lab.play()

		parentElements.red.find(".play").click () ->
			modules.red.play()

		parentElements.blue.find(".play").click () ->
			modules.blue.play()
		
		parentElements.custom.find(".play").click () ->
			modules.custom.play()

	# initialize the elements
	do massListener = () ->

		# when we update mass it should update accordingly in each element!
		listen = (colorClass) =>

			elements = parent.find(colorClass).find("input")

			# listen for changes on the sliders
			elements.change () ->

				value = $(this).attr "value"
				# for each module, need to call the change mass element!
					
				# set the ball mass / size
				setMass = for key, module of modules

					# get the proper element
					_element = if colorClass == ".blue_mass" then module.elements.b else module.elements.a
					_element.setMass value
		
				# set the slider positions!
				elements.each () ->

					$(this).attr "value", value
					label = $(this).parent().children(".label").children("span:nth-child(2)")
					label.text value

		# initialize the listener closures for each type of mass element
		listen colorClass for colorClass in [".blue_mass", ".red_mass"]

	# initialize all the velocity elements for each frame that can be edited
	do velocityListener = () ->

		listen = (velocityClass) =>

			# all elements!
			elements = parent.find(velocityClass).find("input")

			moduleChanges = if velocityClass == ".red_velocity" then ["lab", "blue", "custom"] else if velocityClass == ".blue_velocity" then ["lab", "red", "custom"] else ["red", "blue","custom"] 

			elements.change () ->

				# get the new velocity
				value = $(this).attr "value"

				# set the velocity for the frames that are allowed to change! -- as determined above!
				
				do setVelocity = () ->

					for _module in moduleChanges #go through each module and then update the backend properly!

						do (_module) ->

							module = modules[_module]
							element = if element == ".red_velocity" then module.elements.a else if element == ".blue_velocity" then module.elements.b else module.elements.frame

							element.setVelocity value

				do setVisible = () ->

					# update the visible changes!
					elements.each () ->

						$(this).attr "value", value
						span = $(this).parent().children(".label").children("span:nth-child(2)")
						span.text value
					



		listen velocityClass for velocityClass in [".blue_velocity", ".red_velocity", ".frame_velocity"]




