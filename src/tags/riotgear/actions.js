module.exports = {
	hideModal: hideModal,
	showModal: showModal,
	openDrawer: openDrawer,
	closeDrawer: closeDrawer
}

function showModal(){
	return {type: 'SHOW_MODAL', data:true }
}

function hideModal(){
	return {type: 'HIDE_MODAL', data:false}
}

function openDrawer(){
	var drawer = {
		header: 'Drawer',
		isvisible: true,
		position: 'top|right|bottom|left',
		items: [{
			id: 1,
			text: 'Item 1'}
		, {
			id: 2,
			text: 'Item 2'
		}]
	}
	return {type: 'SHOW_DRAWER', data:drawer}
}

function closeDrawer(){
	var drawer = {
		header: 'Drawer',
		isvisible: false,
		position: 'top|right|bottom|left',
		items: [{
			id: 1,
			text: 'Item 1'}
		, {
			id: 2,
			text: 'Item 2'
		}]
	}	
	return {type: 'CLOSE_DRAWER', data:drawer}
}