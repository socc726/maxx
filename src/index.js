var riot = require('riot');
var redux = require('redux');
var thunk = require('redux-thunk').default;
var reducer = require('./reducer.js');
var blaze = require('pure');
var styles = require("./styles/styles.css");
var layoutActions = require('./tags/layout/actions.js');


var createStoreWithMiddleware = redux.compose(
	redux.applyMiddleware(thunk)
)(redux.createStore);

var reduxStore = createStoreWithMiddleware(reducer);

riot.route(function(collection,id,action){
	if(collection == "contact"){
		reduxStore.dispatch(layoutActions.createContactPage());	
	}
	if(collection == "news"){
		reduxStore.dispatch(layoutActions.createNewsPage());
	}
	if(collection == "faq"){
		reduxStore.dispatch(layoutActions.createFaqPage());
	}
	if(collection == "products"){
		reduxStore.dispatch(layoutActions.createProductsPage());
	}
	if(collection == "checkout"){
		reduxStore.dispatch(layoutActions.createCheckOutPage());
	}
	if(!collection){
		reduxStore.dispatch(layoutActions.createHomePage());
	}
});

document.addEventListener('DOMContentLoaded', function(){
	riot.compile(function() {
		riot.mount('app-sidebar', {store:reduxStore});
		riot.mount('app-main', {store:reduxStore});
		riot.route.base('/#');
		riot.route.start(true);
	});
});

// layouts
require('./tags/layout/app-sidebar.tag');
require('./tags/layout/sidebar-item.tag');
require('./tags/layout/app-main.tag');

// pages
require('./tags/pages/home.tag');
require('./tags/pages/products.tag');
require('./tags/pages/product.tag');
require('./tags/pages/news.tag');
require('./tags/pages/faq.tag');
require('./tags/pages/contact.tag');
require('./tags/pages/receipt.tag');
require('./tags/pages/checkout.tag');
require('./tags/pages/shopping-cart.tag');

// components
require('./tags/components/component-logos.tag');
require('./tags/components/component-hp.tag');
require('./tags/components/component-products.tag');
require('./tags/components/component-shoppingcart.tag');
require('./tags/components/component-contact.tag');
require('./tags/components/component-shipping.tag');
require('./tags/components/component-billing.tag');
// todo component
require('./tags/todo/todo-app.tag');
require('./tags/todo/task-list.tag');
require('./tags/todo/task-form.tag');

// calendar component
require('./tags/riotgear/modal.tag');
require('./tags/riotgear/bubble.tag');
require('./tags/riotgear/shopping-cart.tag');

//error message
require('./tags/shared/error-message.tag');

//loading gif
require('./tags/shared/loading-indicator.tag');
