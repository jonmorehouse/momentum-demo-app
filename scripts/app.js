requirejs.config({

	// make sure that our 
	urlArgs: "bust=" + (new Date()).getTime(),//used to keep the browser from caching the scripts as we move
	baseUrl : "scripts",//base scripts page!


	paths : {	

		'jquery' : "../components/jquery/jquery.min", //specific libraries -- can be specified later
		'paper' : "../components/paper/paper"
	},

	shim: {

        'paper' : {
        	exports: 'paper'//export the paper global var! -- no need to work with 
        },
    },
});

// initialize the document with a doc ready!
requirejs(["jquery", "controller"], function ($, controller) {

	// run the controller after jquery load?


});