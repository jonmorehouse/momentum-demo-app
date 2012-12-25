Momentum Project
=

Overview
-

Four canvases will be built to explore momentum through a web application. 

Tools
-

-	HTML5 / CSS3 / JS
-	SASS CSS Compiler
-	JQuery
-	PaperJS
-	CoffeeScript

Compiler Overview
-

The idea behind this coffeescript built compiler is to compile quick sites on the fly. It relies on a layout.jade file in the current directory, which loads the proper templates in as we need them. 

A data object is created using modules of other coffeescript literals. Each layout uses the its own scoped data. For now the scope is not fixed but working on this soon in next update.

Application Logic
-

Javascript Resources

-	modernizr.js is loaded as a script tag to make intialization of page quicker. Loads before jquery, require etc
-	require.js uses the script/app.js page to initialize all front-end javascript
-	all dependencies are managed through require, including paper.js which is the main framework being used here

Javascript Logic

-	We want a signal slot mechanism .. want to send a global update function for each element to set the velocity etc of each
-	Each function will have a setter / getter to set the value of the change etc


Individual PaperJS Modules:

-	setters = set velocity a,b and frame. These need to be modularized internally to allow for ones where we can't change them
	-	also need to resize the velocity arrows!
-	run function

