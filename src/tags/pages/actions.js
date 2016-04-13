var sharedActions = require('../shared/actions.js');
var toggleLoading = sharedActions.toggleLoading;
var http = require('../../http.js');
var apikey = '89f81c60-7457-431a-941d-3fd1c14c70dc';
var username = '139647';
var password = '209773';

var request = {
	url: 'https://etsemoney.com/hp/v3/adapters',
	requestHeaders: { 'Content-Type': 'application/json', 'X-EMoney-Manager': 'EMoney' }
}

module.exports = {
  createSignInRequest: createSignInRequest,
  createPaymentInstrument: createPaymentInstrument,
  createChargeRequest: createChargeRequest,
  createAccountStatusRequest: createAccountStatusRequest,
  createTransactionStatusRequest: createTransactionStatusRequest,
  createAuthorizeRequest: createAuthorizeRequest
}

function createSignInRequest(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);

		request.data = {
			'signIn' : {
				'signInRequest': {
					'apiKey': apikey
				}
			}
		}

		httpClient.post(request).then(function(data){
			dispatch(hostedResponse(data));
			dispatch(toggleLoading(false));
		}).catch(httpClient.error);
	}
}

function createPaymentInstrument(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);
		var hostedState = getState().hosted;
		request.data = {
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

		httpClient.post(request).then(function(data){
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

		request.data = {
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

		httpClient.post(request).then(function(data){
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
		request.data = {
			'authorize': {
				'authorizeRequest': {
					'token': getState().hosted.signInResponse.token,
					'amount': 30.00,
					'transactionId': getState().hosted.createPaymentInstrumentResponse.transactionId,
					'instrumentId': getState().hosted.createPaymentInstrumentResponse.instrumentId,
				}
			}
		}

		httpClient.post(request).then(function(data){
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
		request.data = {
			'status': {
				'statusRequest': {
					'token': getState().hosted.signInResponse.token,
					'instrumentId': getState().hosted.createPaymentInstrumentResponse.instrumentId,
				}
			}
		}

		httpClient.post(request).then(function(data){
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
		request.data = {
			'status': {
				'statusRequest': {
					'token': getState().hosted.signInResponse.token,
					'transactionId': getState().hosted.createPaymentInstrumentResponse.transactionId,
				}
			}
		}

		httpClient.post(request).then(function(data){
			hostedState.transactionStatusResponse = data.statusResponse;
			dispatch(hostedResponse(hostedState));
			dispatch(toggleLoading(false));
		})
	}
}

function hostedResponse(response){
	return {type:'HOSTED_RESPONSE', data:response};
}
