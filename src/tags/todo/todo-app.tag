<todo-app>

<error-message message={this.state.errorMessage} hide={hideErrorMessage} iserror={this.state.isError}></error-message>

<loading-indicator loading={this.state.isLoading}></loading-indicator>

<task-form addtask={this.handleNewTask}></task-form>

<task-list tasks={this.state.tasks} handlecheck={handleTaskCompletionChange}></task-list>

<rg-modal hide={hideModal} modal={this.state.modal}></rg-modal>

<rg-bubble bubble="{{text:'french'}}">
	Super long
</rg-bubble>

<script>
	var actions = require('./actions.js');
	var sharedActions = require('../shared/actions.js');
	var riotGearActions = require('../riotgear/actions.js');
	var store = this.opts.store;

	store.subscribe(function(){
		this.state = store.getState();
		this.update();
	}.bind(this));

	handleNewTask(task){
		store.dispatch(actions.addTask(task));
	}

	handleTaskCompletionChange(id, isComplete){
		store.dispatch(actions.toggleComplete(id,isComplete));
	}

	hideErrorMessage(){
		store.dispatch(sharedActions.hideError());
	}

	showModal(){
		store.dispatch(riotGearActions.showModal());
	}

	hideModal(){
		store.dispatch(riotGearActions.hideModal());
	}
	this.on('mount', function(){
		store.dispatch(actions.loadTasks());
		this.showModal();
	});
</script>

</todo-app>