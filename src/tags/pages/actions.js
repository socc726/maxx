var sharedActions = require('../shared/actions.js');
var toggleLoading = sharedActions.toggleLoading;
var http = require('../../http.js');
var apikey = '89f81c60-7457-431a-941d-3fd1c14c70dc';
var request = {
	url: 'https://etsemoney.com/hp/v3/adapters',
	requestHeaders: { 'Content-Type': 'application/json' }
}

module.exports = {
  createSignInRequest: createSignInRequest,
  createPaymentInstrument: createPaymentInstrument,
  createChargeRequest: createChargeRequest,
  createAccountStatusRequest: createAccountStatusRequest,
  createTransactionStatusRequest: createTransactionStatusRequest
}

function createSignInRequest(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);

		request.data = {
			'signIn' : {
				'signInRequest': {
					'apiKey': apikey,
					'correlationId': 0
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
					'correlationId': '',
					'properties': {
						'nameOnCard': 'Sam Merrill',
						'cardNumber': '4012111111111111',
						'expirationDate': '12/2019',
						'cvv':'999'
					},
					'billingAddress': {
						'addressLine1': '',
						'postalCode': ''
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
					'token': getState().hosted.signInResponse.token,
					'transactionId': getState().hosted.createPaymentInstrumentResponse.transactionId,
					'instrumentId': getState().hosted.createPaymentInstrumentResponse.instrumentId,
					'amount': 30.00,
					'correlationId': ''
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
					'correlationId': ''
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
					'correlationId': ''
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


















