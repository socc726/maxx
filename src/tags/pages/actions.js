var sharedActions = require('../shared/actions.js');
var toggleLoading = sharedActions.toggleLoading;
var http = require('../../http.js');
var apikey = '89f81c60-7457-431a-941d-3fd1c14c70dc';
var username = '139647';
var password = '209773';

var hpRequest = {
	url: 'https://etsemoney.com/hp/v3/adapters',
	requestHeaders: { 'Content-Type': 'application/json', 'X-EMoney-Manager': 'EMoney' }
}

var inventoryRequest = {
	url: 'https://api.pmoney.com/inventory/712affc1/products',
	requestHeaders: { 'Content-Type': 'application/json', 'x-api-internal-key': '0133be58be5a4627b0ccaf8258023459', 'Accept': 'application/json'}
}

module.exports = {
  createSignInRequest: createSignInRequest,
  createUserInfo: createUserInfo,
  createPaymentInstrument: createPaymentInstrument,
  createChargeRequest: createChargeRequest,
  createAccountStatusRequest: createAccountStatusRequest,
  createTransactionStatusRequest: createTransactionStatusRequest,
  createAuthorizeRequest: createAuthorizeRequest,
  getProductsFromInventory: getProductsFromInventory
}

function getProductsFromInventory(){
	return function(dispatch, getState){

		var httpClient = new http.client([]);

		httpClient.get(inventoryRequest).then(function(data){
			dispatch(inventoryResponse(data));
			dispatch(toggleLoading(false));
		}).catch(httpClient.error);
	}
}

function createSignInRequest(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);
		hpRequest.data = {
			'signIn' : {
				'signInRequest': {
					'apiKey': apikey
				}
			}
		}

		httpClient.post(hpRequest).then(function(data){
			dispatch(hostedResponse(data));
			dispatch(toggleLoading(false));
		}).catch(httpClient.error);
	}
}

function validateContactInfo(contact){

}

function getContact(info){
	var contact = info.tags['component-contact'];

	validateContactInfo(contact);

	return {
		name: contact.firstName.value + " " + contact.lastName.value,
		email: contact.email.value,
		phone: contact.phone.value
	}
}

function validateBillingInfo(billing){

}

function getBilling(info){
	var billing = info.tags['component-billing'];
	
	validateBillingInfo(billing);

	return {
		city: billing.city.value,
		state: billing.state.value,
		zip: billing.zip.value,
		address: billing.address.value
	}
}

function validateShippingInfo(shipping){

}

function getShipping(info){
	var shipping = info.tags['component-shipping'];
	
	validateShippingInfo(shipping);

	return {
		city: shipping.city.value,
		state: shipping.state.value
	}
}

function validateCardInfo(card){
	card.number.value = card.number.value.replace(/\s/g, '');
	card.expiry.value = card.expiry.value.replace(/\s/g, '');
}

function getCard(info){
	validateCardInfo(info);

	return {
		name: info.name.value,
		number: info.number.value,
		cvv: info.cvc.value,
		expiry: info.expiry.value
	}
}

function buildUserObject(info){
	var user = getContact(info);
	user.billing = getBilling(info);
	user.shipping = getShipping(info);
	user.card = getCard(info);
	return user;
}

function createUserInfo(event){
	return function(dispatch, getState){
		var hostedState = getState().hosted;
		hostedState.user = buildUserObject(event);
		dispatch(hostedResponse(hostedState));
		dispatch(toggleLoading(false));
	}
}

function createPaymentInstrument(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);
		var hostedState = getState().hosted;
		var token = hostedState.signInResponse.token;
		var userInfo = hostedState.user;
		hpRequest.data = {
			'createPaymentInstrument': {
				'createPaymentInstrumentRequest':{
					'token': token,
					'name': userInfo.name,
					'properties': {
						'nameOnCard': userInfo.card.name,
						'cardNumber': userInfo.card.number,
						'expirationDate': userInfo.card.expiry,
						'cvv':userInfo.card.cvv
					},
					'billingAddress': {
						'addressLine1': userInfo.billing.address,
						'postalCode': userInfo.billing.zip
					}
				}
			}
		}

		httpClient.post(hpRequest).then(function(data){
			hostedState.createPaymentInstrumentResponse = data.createPaymentInstrumentResponse;
			
			dispatch(toggleLoading(false));
			return dispatch(hostedResponse(hostedState));
		}).catch(httpClient.error);
	}
}

function createChargeRequest(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);
		var amount = getState().shoppingcart.total
		var hostedState = getState().hosted;

		hpRequest.data = {
			'charge': {
				'chargeRequest': {
					'token': hostedState.signInResponse.token,
					'instrumentId': hostedState.createPaymentInstrumentResponse.instrumentId,
					'amount': amount
				}
			}
		}

		httpClient.post(hpRequest).then(function(data){
			hostedState.chargeResponse = data.chargeResponse;
			dispatch(hostedResponse(hostedState));
			dispatch(toggleLoading(false));
		})
	}
}

function createAuthorizeRequest(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);
		var amount =getState().shoppingcart.total
		var hostedState = getState().hosted;
		hpRequest.data = {
			'authorize': {
				'authorizeRequest': {
					'token': getState().hosted.signInResponse.token,
					'amount': amount,
					'transactionId': getState().hosted.createPaymentInstrumentResponse.transactionId,
					'instrumentId': getState().hosted.createPaymentInstrumentResponse.instrumentId,
				}
			}
		}

		httpClient.post(hpRequest).then(function(data){
			hostedState.authorizeResponse = data.authorizeResponse;
			dispatch(hostedResponse(hostedState));
			dispatch(toggleLoading(false));
		})
	}
}

function createAccountStatusRequest(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);
		//TODO: amount: getState().shoppingcart.total
		var hostedState = getState().hosted;
		hpRequest.data = {
			'status': {
				'statusRequest': {
					'token': getState().hosted.signInResponse.token,
					'instrumentId': getState().hosted.createPaymentInstrumentResponse.instrumentId,
				}
			}
		}

		httpClient.post(hpRequest).then(function(data){
			hostedState.accountStatusResponse = data.statusResponse;
			dispatch(hostedResponse(hostedState));
			dispatch(toggleLoading(false));
		})
	}
}

function createTransactionStatusRequest(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);
		//TODO: amount: getState().shoppingcart.total
		var hostedState = getState().hosted;
		hpRequest.data = {
			'status': {
				'statusRequest': {
					'token': getState().hosted.signInResponse.token,
					'transactionId': getState().hosted.createPaymentInstrumentResponse.transactionId,
				}
			}
		}

		httpClient.post(hpRequest).then(function(data){
			hostedState.transactionStatusResponse = data.statusResponse;
			dispatch(hostedResponse(hostedState));
			dispatch(toggleLoading(false));
		})
	}
}

function hostedResponse(response){
	return {type:'HOSTED_RESPONSE', data:response};
}
function inventoryResponse(response){
	return {type:'INVENTORY_RESPONSE', data:response.items};
}
