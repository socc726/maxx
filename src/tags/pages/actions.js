var sharedActions = require('../shared/actions.js');
var toggleLoading = sharedActions.toggleLoading;

module.exports = {
  createSideBar: createSideBar
}

function createHomePage(){
  return function(dispatch, action){

    dispatch(toggleLoading(true));

    var page = {
      id: "HOME",
      title: "Home Page",
      body: "Welcome to Maxx Rechargeable. Home to the only ion battery recharger"
    };

    console.log('CREATING HOMEPAGE');

    dispatch(openHomePage(page));

    dispatch(toggleLoading(false));   
  }
}

function openHomePage(page){
  return {type: 'OPEN_HOME_PAGE', data:page}
}
function openProductsPage(page){
  return {type: 'OPEN_PRODUCTS_PAGE', data:page}
}

function openProductPage(page){
  return {type: 'OPEN_PRODUCT_PAGE', data:page}
}

function openCheckoutPage(page){
  return {type: 'OPEN_CHECKOUT_PAGE', data:page}
}

function openShoppingCartPage(page){
  return {type: 'OPEN_SHOPPING_CART_PAGE', data:page}
}

function openReceiptPage(page){
  return {type: 'OPEN_RECEIPT_PAGE', data:page}
}

function openNewsPage(page){
  return {type: 'OPEN_NEWS_PAGE', data:page}
}

function openFaqPage(page){
  return {type: 'OPEN_FAQ_PAGE', data:page}
}

function openContactPage(page){
  return {type: 'OPEN_CONTACT_PAGE', data:page}
}























