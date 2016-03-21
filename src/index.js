var riot = require('riot');
var redux = require('redux');
var thunk = require('redux-thunk').default;
var reducer = require('./reducer.js');
var blaze = require('blaze');
require("./styles/styles.css");
// todo component
require('./tags/todo/todo-app.tag');
require('./tags/todo/task-list.tag');
require('./tags/todo/task-form.tag');

// calendar component
require('./tags/riotgear/calendar.tag');
require('./tags/riotgear/modal.tag');
require('./tags/riotgear/bubble.tag');
//error message
require('./tags/shared/error-message.tag');

//loading gif
require('./tags/shared/loading-indicator.tag');


var createStoreWithMiddleware = redux.compose(
	redux.applyMiddleware(thunk)
)(redux.createStore);

var reduxStore = createStoreWithMiddleware(reducer);

document.addEventListener('DOMContentLoaded', function(){
	riot.mount('*', {store:reduxStore});
})