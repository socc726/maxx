module.exports = {
	hideError: hideError,
	toggleLoading: toggleLoading
}

function toggleLoading(isLoading){
	return {type:'TOGGLE_LOADING', data:isLoading}
}

function showError(message){
	return{
		type: 'SHOW_ERROR',
		data: message
	}
}

function hideError(){
	return {type: 'HIDE_ERROR'}
}

function tempErrorMessage(message){
	return function(dispatch, getState){
		dispatch(showError(message));
		setTimeout(function() {
			dispatch(hideError());
		}, 1000)
	}
}































