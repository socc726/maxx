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

function createPaymentInstrument(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);
		var hostedState = getState().hosted;
		hpRequest.data = {
			'createPaymentInstrument': {
				'createPaymentInstrumentRequest':{
					'token': hostedState.signInResponse.token,
					'name': 'Frank Pringle',
					'properties': {
						'nameOnCard': 'Sam Merrill',
						'cardNumber': '4012111111111111',
						'expirationDate': '12/2019',
						'cvv':'999'
					},
					'billingAddress': {
						'addressLine1': '8320',
						'postalCode': '85284'
					}
				}
			}
		}

		httpClient.post(hpRequest).then(function(data){
			hostedState.createPaymentInstrumentResponse = data.createPaymentInstrumentResponse;
			dispatch(hostedResponse(hostedState));
			dispatch(toggleLoading(false));
		}).catch(httpClient.error);
	}
}

function createChargeRequest(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);
		//TODO: amount: getState().shoppingCart.total
		var hostedState = getState().hosted;

		hpRequest.data = {
			'charge': {
				'chargeRequest': {
					'__request': {
						'token': hostedState.signInResponse.token,
						'name': 'Frank Pringle',
						'properties': {
							'nameOnCard': 'Sam Merrill',
							'cardNumber': '4012111111111111',
							'expirationDate': '12/2019',
							'cvv':'999'
						},
						'billingAddress': {
						'addressLine1': '8320',
						'postalCode': '85284'
						}
					},
					'token': getState().hosted.signInResponse.token,
					'transactionId': getState().hosted.createPaymentInstrumentResponse.transactionId,
					'instrumentId': getState().hosted.createPaymentInstrumentResponse.instrumentId,
					'amount': 30.00
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
		//TODO: amount: getState().shoppingCart.total
		var hostedState = getState().hosted;
		hpRequest.data = {
			'authorize': {
				'authorizeRequest': {
					'token': getState().hosted.signInResponse.token,
					'amount': 30.00,
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
		//TODO: amount: getState().shoppingCart.total
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
		//TODO: amount: getState().shoppingCart.total
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
