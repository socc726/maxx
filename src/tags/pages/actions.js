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
  createPaymentInstrument: createPaymentInstrument
}

// function createSignInRequest(){
// 	console.log("goin back to cali");

// 	var httpClient = new http.client([]);
// 	console.log(request);
// 	request.requestHeaders = {
// 		'Content-Type': 'application/json'
// 	}
// 	request.data = {
// 		'signIn' : {
// 			'signInRequest': {
// 				'apiKey': apikey,
// 				'correlationId': 0
// 			}
// 		}
// 	}

// 	httpClient.post(request).then(function(data){
// 		dispatch(tasksLoaded(data));
// 		dispatch(toggleLoading(false));
// 	}).catch(httpClient.error);
// }

function createPaymentInstrument(){
	return function(dispatch, getState){
		var httpClient = new http.client([]);
		var mouth = getState();
		console.dir(mouth);
		request.data = {
			'createPaymentInstrument': {
				'createPaymentInstrumentRequest':{
					'token': getState().hosted.signInResponse.token,
					'name': 'Frank Pringle',
					'correlationId': '',
					'properties': {
						'nameOnCard': 'Sam Merrill',
						'cardNumber': '4012111111111111',
						'expirationDate': '12/19',
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
			dispatch(hostedSignedIn(data));
			dispatch(toggleLoading(false));
		}).catch(httpClient.error);
	}
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
			dispatch(createdInstrument(data));
			dispatch(toggleLoading(false));
		}).catch(httpClient.error);

		// var handleTransaction, handleTransactionError, hostedPaymentDiv, amount, ecomId;
		
		// // if prod
		
		// // get dom elements
		// hostedPaymentDiv = $("#HostedPaymentsV3");
		// amount = $(".amount").text();
		// ecomId = $(".ecomId").text();
		
		// // set data attributes before calling hosted payments method on div.
		// hostedPaymentDiv.data("amount", amount);
		// hostedPaymentDiv.data("ets-key", ecomId);
		
		// handleTransaction = function (transactions) {
		// 	console.log("Success");
		// 	console.dir(transactions);
		// };
		
		// handleTransactionError = function (error) {
		// 	console.log("ERROR");
		// 	console.dir(error);
		// };
		
		// hostedPaymentDiv.hp({
		// 	baseUrl: base,
		// 	successCallback: handleTransaction,
		// 	errorCallback: handleTransactionError,
		// 	paymentService: "EMoney",
		// 	paymentTypeOrder: [0]
		// });
	}
}

function hostedSignedIn(response){
	return {type:'HOSTED_SIGN_IN', data:response};
}

function createdInstrument(response){
	return {type:'HOSTED_CREATED_INSTRUMENT', data:response};
}

function completeChanged(id, isComplete){
	return {
		type: 'TASK_COMPLETION_CHANGED',
		data: {
			id: id,
			isComplete: isComplete
		}
	}
}




















