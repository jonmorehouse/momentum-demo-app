({
	// appdir: "/Users/MorehouseJ09/Documents/production_development/momentum_deploy/",
	baseUrl: ".",
	paths: {

		requireLib: "../resources/require",
		jquery: "../resources/jquery",
		paper: "../resources/paper"
	},

	shim: {

        'paper' : {
        	exports: 'paper'//export the paper global var! -- no need to work with 
        },
    },

    include: ["requireLib", "paper"],
	name: "app",
	out: "../resources/app.js",
	optimize: "none"

})