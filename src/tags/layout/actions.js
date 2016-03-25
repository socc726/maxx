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

		console.log('CREATING SIDEBAR');
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

    console.log('CREATING HOMEPAGE');

    dispatch(openHomePage(page));
  
  }
}

function createProductsPage(){
  return function(dispatch, action){

    var page = {
      id: "PRODUCTS",
      title: "Products Page",
      body: "Choose from the products below:"
    };

    console.log('CREATING PRODUCTS PAGE');

    dispatch(openProductsPage(page));
  }
}

function createNewsPage(){
  return function(dispatch, action){

    var page = {
      id: "NEWS",
      title: "News Page",
      body: "Welcome to Maxx Rechargeable. Home to the only ion battery recharger"
    };

    console.log('CREATING HOMEPAGE');

    dispatch(openNewsPage(page));
 
  }
}

function createFaqPage(){
  return function(dispatch, action){

    var page = {
      id: "FAQ",
      title: "FAQ Page",
      body: "Welcome to Maxx Rechargeable. Home to the only ion battery recharger"
    };

    console.log('CREATING HOMEPAGE');

    dispatch(openHomePage(page));
  }
}

function createContactPage(){
  return function(dispatch, action){

    var page = {
      id: "CONTACT",
      title: "Contact Page",
      body: "Welcome to Maxx Rechargeable. Home to the only ion battery recharger"
    };

    console.log('CREATING HOMEPAGE');

    dispatch(openHomePage(page));
  }
}

function createCheckOutPage(){
  return function(dispatch, action){

    var page = {
      id: "CHECKOUT",
      title: "Checkout Page",
      body: "Welcome to Maxx Rechargeable. Home to the only ion battery recharger"
    };

    console.log('CREATING Checkout');

    dispatch(openCheckoutPage(page));
  }
}

function openHomePage(page){
  return {type: 'OPEN_HOME_PAGE', data:page}
}
function openProductsPage(page){
  return {type: 'OPEN_PRODUCTS_PAGE', data:page}
}

function openProductPage(page){
  return {type: 'OPEN_PRODUCT_PAGE', data:page}
}

function openCheckoutPage(page){
  return {type: 'OPEN_CHECKOUT_PAGE', data:page}
}

function openShoppingCartPage(page){
  return {type: 'OPEN_SHOPPING_CART_PAGE', data:page}
}

function openReceiptPage(page){
  return {type: 'OPEN_RECEIPT_PAGE', data:page}
}

function openNewsPage(page){
  return {type: 'OPEN_NEWS_PAGE', data:page}
}

function openFaqPage(page){
  return {type: 'OPEN_FAQ_PAGE', data:page}
}

function openContactPage(page){
  return {type: 'OPEN_CONTACT_PAGE', data:page}
}
function sideBarCreated(sidebar){
	return {type: 'SIDEBAR_CREATED', data:sidebar}
}

