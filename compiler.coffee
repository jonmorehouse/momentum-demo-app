# MODULES
jade = require "jade"#external module
fs = require "fs"

# SHORTCUTS
print = console.log

# GLOBAL VARIABLES
outputFile = "index.html"
templateOptions =

	pretty: true



compile = () ->

	# steps
	# 1.) compile header with options
	# 2.) compile canvas for each of the scripts
	# 3.) compile footer and overwrite
	# create header -- this clears the previous file if it exists and has content
	fs.readFile "templates/header.jade", "utf8", (err, rawTemplate) ->
			
		data = require "./data/header.coffee"

		template = jade.compile rawTemplate, templateOptions

		html = template data

		fs.writeFile outputFile, html

# initialize program controllers below -- for watching etc
compile()

