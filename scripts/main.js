requirejs.config({

	baseUrl: "scripts",//
	urlArgs: "bust=" +  (new Date()).getTime()//used to keep the browser from caching the scripts as we move

});

/*

	Could load in modules as a directory which requires everything in those directories?

	Then could have a pages element that loads in these elements?

*/
requirejs(["resources/jquery", "test"], 

	function($, test) {

		test.test();


});
