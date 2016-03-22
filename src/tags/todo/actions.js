var sharedActions = require('../shared/actions.js');
var toggleLoading = sharedActions.toggleLoading;
var tempErrorMessage = sharedActions.tempErrorMessage;

module.exports = {
	loadTasks: loadTasks,
	addTask: addTask,
	toggleComplete: toggleComplete
}

function loadTasks(){
	return function(dispatch, getState){
		dispatch(toggleLoading(true));
		var request = new XMLHttpRequest();
		request.open('GET', 'http://localhost:3000/tasks', true);
		request.onload = function(){
			if(request.status >= 200 && request.status < 400){
				var data = JSON.parse(request.responseText);
				dispatch(tasksLoaded(data));
			}
			dispatch(toggleLoading(false));
		}
		setTimeout(function(){
			request.send();
		}, 2000)
	}
}

function addTask(newTask){
	return function(dispatch, getState){
		dispatch(toggleLoading(true));
		var request = new XMLHttpRequest();
		request.open("POST","http://localhost:3000/tasks",true);
		request.setRequestHeader("Content-Type", "application/json");
		request.onload = function(){
			if(request.status >= 200 && request.status <= 400){
				var data = JSON.parse(request.responseText);
				dispatch(newTaskAdded(data.id, data.name));
			}
			dispatch(toggleLoading(false));
		}
		var jstring = JSON.stringify({name: newTask});
		request.send(jstring);
	}
}

function toggleComplete(id, isComplete){
	return function(dispatch, getState){
		var request = new XMLHttpRequest();
		request.open('PATCH', `http://localhost:3000/tasks/${id}`, true);
		request.setRequestHeader("Content-Type", "application/json");
		request.onload = function(){
			if(request.status >= 200 && request.status <= 400){
				dispatch(completeChanged(id, isComplete));
			} else {
				dispatch(completeChanged(id, !isComplete));
				dispatch(tempErrorMessage('API error'));
			}
		
		}

		request.send(JSON.stringify({isComplete: isComplete}));
	}
}

function tasksLoaded(tasks){
	return {type:'TASKS_LOADED', data:tasks};
}

function newTaskAdded(id, name){
	return {type:'TASK_ADDED', data: {id:id, name:name}};
}

function completeChanged(id, isComplete){
	return {
		type: 'TASK_COMPLETION_CHANGED',
		data: {
			id: id,
			isComplete: isComplete
		}
	}
}































