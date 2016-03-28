var sharedActions = require('../shared/actions.js');
var toggleLoading = sharedActions.toggleLoading;

module.exports = {
	createSideBar: createSideBar,
	createHomePage: createHomePage,
  createProductsPage: createProductsPage,
  createFaqPage: createFaqPage,
  createNewsPage: createNewsPage,
  createContactPage: createContactPage,
  createCheckOutPage: createCheckOutPage
}

function createSideBar(){
	return function(dispatch, action){
		dispatch(toggleLoading(true));

		var links = [
			{
				name: "Home", 
				url: ""
			},
			{
				name: "CR2 Charger & Batteries",
				url: "products"
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
				url: "checkout"
			}

		];
		
		var sidebar = {
			links:links
		}


		dispatch(sideBarCreated(sidebar));

		dispatch(toggleLoading(false));		
	}
}

function createHomePage(){
  return function(dispatch, action){

    var page = {
      id: "HOME",
      title: "Home Page",
      body: "Welcome to Maxx Rechargeable. Home to the only ion battery recharger"
    };

    dispatch(openPage(page));
  
  }
}

function createProductsPage(){
  return function(dispatch, action){

    var page = {
      id: "PRODUCTS",
      title: "Products Page",
      body: "Choose from the products below:"
    };

    dispatch(openPage(page));
  }
}

function createNewsPage(){
  return function(dispatch, action){

    var page = {
      id: "NEWS",
      title: "News Page",
      body: "Welcome to Maxx Rechargeable. Home to the only ion battery recharger"
    };

    dispatch(openPage(page));
 
  }
}

function createFaqPage(){
  return function(dispatch, action){

    var page = {
      id: "FAQ",
      title: "FAQ Page",
      body: "Welcome to Maxx Rechargeable. Home to the only ion battery recharger"
    };

    dispatch(openPage(page));
  }
}

function createContactPage(){
  return function(dispatch, action){

    var page = {
      id: "CONTACT",
      title: "Contact Page",
      body: "Welcome to Maxx Rechargeable. Home to the only ion battery recharger"
    };

    dispatch(openPage(page));
  }
}

function createCheckOutPage(){
  return function(dispatch, action){

    var page = {
      id: "CHECKOUT",
      title: "Checkout Page",
      body: "Welcome to Maxx Rechargeable. Home to the only ion battery recharger"
    };

    dispatch(openPage(page));
  }
}

function openPage(page){
  return {type: 'OPEN_PAGE', data:page}
}

function sideBarCreated(sidebar){
	return {type: 'SIDEBAR_CREATED', data:sidebar}
}

