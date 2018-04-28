import 'skrollr';

function homeSkrollr () {
	const landing = document.getElementById('landing');
	if (landing) {
		require(['skrollr'], function(skrollr){
			const s = skrollr.init();
		});
	};
};

export { homeSkrollr }