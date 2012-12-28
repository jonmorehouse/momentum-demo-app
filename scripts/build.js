({
	// appdir: "/Users/MorehouseJ09/Documents/production_development/momentum_deploy/",
	baseUrl: ".",
	paths: {

		jquery: "../resources/jquery",
		paper: "../resources/paper",
		requireLib: "../resources/require"
	},

	shim: {

        'paper' : {
        	exports: 'paper'//export the paper global var! -- no need to work with 
        },
    },

	name: "app",
	out: "../resources/app.js",
	include: "requireLib"

})

// bundling require.js with the main file 
// node ../../r.js -o baseUrl=. paths.requireLib=../../require name=main include=requireLib out=main-built.js

