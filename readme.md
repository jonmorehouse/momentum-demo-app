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
-	Jquery is used and extended throughout. Didn't want to include external jquery libraries so I wrote my own easing functions. Made sure to require jquery where needed instead of depending upon calling function. (Saw an error on deployment with out this backup).

Javascript Logic

-	Application is built based on a jade template. I built a compiler tool to build the webpage dynamically. The data/canvas.coffee data corresponds to the master html data. I matched this up to the objects in the scripts/controller.coffee file.
-	There are listeners on the proper "class" elements to map to the paper.js modules for live updating.





