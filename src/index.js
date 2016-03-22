var riot = require('riot');
var redux = require('redux');
var thunk = require('redux-thunk').default;
var reducer = require('./reducer.js');
var blaze = require('blaze');
var styles = require("./styles/styles.css");

// layouts
require('./tags/layout/app-sidebar.tag');
require('./tags/layout/sidebar-item.tag');
require('./tags/layout/app-main.tag');

// todo component
require('./tags/todo/todo-app.tag');
require('./tags/todo/task-list.tag');
require('./tags/todo/task-form.tag');

// calendar component
require('./tags/riotgear/calendar.tag');
require('./tags/riotgear/modal.tag');
require('./tags/riotgear/bubble.tag');
require('./tags/riotgear/shopping-cart.tag');
//error message
require('./tags/shared/error-message.tag');

//loading gif
require('./tags/shared/loading-indicator.tag');


var createStoreWithMiddleware = redux.compose(
	redux.applyMiddleware(thunk)
)(redux.createStore);

var reduxStore = createStoreWithMiddleware(reducer);


riot.route(function(collection,id,action){
	console.log("ROUTE CHANGE" + id);
});

document.addEventListener('DOMContentLoaded', function(){
	console.log(riot);
	riot.compile(function(){
		riot.mount('*', {store:reduxStore});
		riot.route.base('/');
		riot.route.start(true);	
	})

});