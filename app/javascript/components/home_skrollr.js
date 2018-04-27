import 'skrollr';

function homeSkrollr () {
	landing = document.getElementById('landing');
	if (landing) {
		require(['skrollr'], function(skrollr){
			var s = skrollr.init();
		});
	};
};

export { homeSkrollr }