requirejs.config({

	// make sure that our 
	urlArgs: "bust=" + (new Date()).getTime(),//used to keep the browser from caching the scripts as we move
	baseUrl : "scripts",//base scripts page!


	paths : {	

		'jquery' : "../resource/jquery", //specific libraries -- can be specified later
		'paper' : "../resources/paper"
	},

	shim: {

        'paper' : {
        	exports: 'paper'//export the paper global var! -- no need to work with 
        },
    },
});

// initialize the document with a doc ready!
requirejs(["jquery", "paper", "controller"], function ($, paper, controller) {

	// run the controller after jquery load?


});