var sharedActions = require('../shared/actions.js');
var toggleLoading = sharedActions.toggleLoading;
var http = require('../../http.js');

module.exports = {
  loadHostedPayments: loadHostedPayments,
  createPaymentInstrument: createPaymentInstrument
}

function createSignInRequest(apikey){
	var json = {
		"api-key": apikey,
		"ecomrequestid": apikey
	}
	var res = http().post(json);
}

function createPaymentInstrument(apikey){
	var json = {
		"api-key": apikey,
		"ecomrequestid": apikey
	}
	var res = http().post(json);
}


function loadHostedPayments(){
	return function(dispatch, action){
		createSignInRequest();

		var handleTransaction, handleTransactionError, hostedPaymentDiv, amount, ecomId;
		
		// if prod
		var base ="https://etsemoney.com/hp/v3/adapters";
		
		// get dom elements
		hostedPaymentDiv = $("#HostedPaymentsV3");
		amount = $(".amount").text();
		ecomId = $(".ecomId").text();
		
		// set data attributes before calling hosted payments method on div.
		hostedPaymentDiv.data("amount", amount);
		hostedPaymentDiv.data("ets-key", ecomId);
		
		handleTransaction = function (transactions) {
			console.log("Success");
			console.dir(transactions);
		};
		
		handleTransactionError = function (error) {
			console.log("ERROR");
			console.dir(error);
		};
		
		hostedPaymentDiv.hp({
			baseUrl: base,
			successCallback: handleTransaction,
			errorCallback: handleTransactionError,
			paymentService: "EMoney",
			paymentTypeOrder: [0]
		});
	}
}



















