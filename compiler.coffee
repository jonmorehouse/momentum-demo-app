jade = require "jade"
fs = require "fs"

outputFile = "index.html"

# steps
# 1.) compile header with options
# 2.) compile canvas for each of the scripts
# 3.) compile footer and overwrite

# create header -- this clears the previous file if it exists and has content
fs.readFile "templates/header.jade", "utf8", (err, rawTemplate) ->
		
	data = require "./data/header.coffee"

	options =

		pretty: true

	template = jade.compile rawTemplate, options

	html = template data

	fs.writeFile outputFile, html


# read each of the canvases and load in their proper data
fs.readFile "templates/canvas.jade", "utf8", (err, rawTemplate) ->

	data = require "./data/canvas.coffee"



# var fn = jade.compile('string of jade', options);
# fn(locals);


