var sharedActions = require('../shared/actions.js');
var toggleLoading = sharedActions.toggleLoading;

module.exports = {
	createSideBar: createSideBar
}

function createSideBar(){
	return function(dispatch, action){
		dispatch(toggleLoading(true));

		console.log('CREATING SIDEBAR');
		var links = [
			{
				name: "Home", 
				url: ""
			},
			{
				name: "CR2 Charger & Batteries",
				url: "charger"
			},
			{
				name: "News",
				url: "news"
			},
			{
				name: "FAQ",
				url: "faq"
			},
			{
				name: "Contact Us",
				url: "contact"
			}

		];
		var sidebar = {
			links:links
		}

		dispatch(sideBarCreated(sidebar));

		dispatch(toggleLoading(false));		
	}
}

function sideBarCreated(sidebar){
	return {type: 'SIDEBAR_CREATED', data:sidebar}
}





// var r = riot.route.create();

// r(highlightCurrent);

// var url = location.pathname.replace(new RegExp('/', 'g'), '');

// function highlightCurrent(id){
// 	if(id === url) {id = ''};
// 	self.selectedId = id;
// 	self.update();
// }



























