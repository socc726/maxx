module.exports = {
	hideModal: hideModal,
	showModal: showModal
}

function showModal(){
	return {type: 'SHOW_MODAL', data:true }
}

function hideModal(){
	return {type: 'HIDE_MODAL', data:false}
}
