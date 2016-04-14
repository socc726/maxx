var state,
	action;

module.exports = function(s={tasks:[]}, a){
	state = s;
	action = a;
	
	switch(action.type){
		case 'TASKS_LOADED':
			return Object.assign({}, state, {tasks:action.data});
		case 'TOGGLE_LOADING':
			return Object.assign({}, state, {isLoading:action.data});
		case 'TASK_ADDED':
			return Object.assign({}, state, {tasks:state.tasks.concat(action.data)});
		case 'TASK_COMPLETION_CHANGED':
			return Object.assign({}, state, {tasks:getNewTasks()});
		case 'SHOW_ERROR':
			return Object.assign({}, state, {isError:true, errorMessage:action.data});
		case 'HIDE_ERROR':
			return Object.assign({}, state, {isError:false, errorMessage:''} );
		case 'HIDE_MODAL':
			return Object.assign({}, state, {modal:{isvisible:action.data, dismissable:true}});
		case 'SHOW_MODAL':
			return Object.assign({}, state, {modal:{isvisible:action.data, dismissable:true}});
		case 'SHOW_DRAWER':
			return Object.assign({}, state, {drawer:action.data});
		case 'CLOSE_DRAWER':
			return Object.assign({}, state, {drawer:action.data});
		case 'SIDEBAR_CREATED':
			return Object.assign({}, state, {sidebar:action.data});
		case 'OPEN_PAGE':
			return Object.assign({}, state, {page:action.data});
		case 'LOGOS_CREATED':
			return Object.assign({}, state, {images:action.data});
		case 'HOSTED_RESPONSE':
			return Object.assign({}, state, {hosted:action.data});
		case 'INVENTORY_RESPONSE':
			return Object.assign({}, state, {inventory:action.data});			
		default:
			//return current state
			return state;
	}

	return state;
};

var getNewTasks = function(){
	var taskIndex = state.tasks.findIndex(function(task){
		return task.id == action.data.id;
	});
	var newTasks = [
		...state.tasks.slice(0, taskIndex),
		Object.assign({}, state.tasks[taskIndex], {isComplete:action.data.isComplete}),
		...state.tasks.slice(taskIndex + 1)
	];
	return newTasks;
}