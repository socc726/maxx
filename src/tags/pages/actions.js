var sharedActions = require('../shared/actions.js');
var toggleLoading = sharedActions.toggleLoading;

module.exports = {
  loadHostedPayments: loadHostedPayments
}


function loadHostedPayments(){
	return function(dispatch, action){

	console.log("JJLKJ")

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



















