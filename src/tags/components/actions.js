var sharedActions = require('../shared/actions.js');
var toggleLoading = sharedActions.toggleLoading;
var cart = require('../../cart.js').cart;

module.exports = {
	createLogoImages: createLogoImages,
  getCart: getCart,
  emptyCart: emptyCart
}

function getCart(){
  return function(dispatch, action){
    dispatch(shoppingCart(cart()));
  }
}
function emptyCart(){
	return function(dispatch, action){
		cart().clear()
		dispatch(shoppingCart(cart()));
	}
}
function shoppingCart(cart){
	console.log(cart);
  return {type: 'SHOPPING_CART', data:cart}
}

function createLogoImages(){
	return function(dispatch, action){
		dispatch(toggleLoading(true));

		var images = [
			{
				name: "Bushnell", 
				src: "../../src/images/bushnell_logo.png"
			},
			{
				name: "Golf Buddy", 
				src: "../../src/images/golf_buddy.jpg"
			},
			{
				name: "Halo", 
				src: "../../src/images/halo_logo.png"
			},
			{
				name: "Laser", 
				src: "../../src/images/laser_logo.jpg"
			},
			{
				name: "Leupold", 
				src: "../../src/images/leupold_logo.jpg"
			},
			{
				name: "Nikon", 
				src: "../../src/images/nikon_logo.jpg"
			},			
			{
				name: "Opti Logic", 
				src: "../../src/images/opti_logic.jpg"
			},
			{
				name: "Redfield", 
				src: "../../src/images/redfield_logo.jpg"
			},
			{
				name: "Steinder", 
				src: "../../src/images/steinder_logo.jpg"
			},
			{
				name: "Vortex", 
				src: "../../src/images/vortex_logo.jpg"
			},
			{
				name: "Zeiss", 
				src: "../../src/images/zeiss_logo.jpg"
			}
		];
		
		var logoImages = {
			images:images
		}


		dispatch(logoComponentCreated(logoImages));

		dispatch(toggleLoading(false));		
	}
}

function logoComponentCreated(images){
	return {type: 'LOGOS_CREATED', data:images}
}