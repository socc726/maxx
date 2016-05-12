<checkout-page>


		<component-hp customer={this.state.customer} handlesubmit={handleSubmit}>

		</component-hp>

	<script>

	  var actions = require('./actions.js');
	  var store = this._parent.opts.store;

		store.subscribe(function(){
			this.state = store.getState();
			this.update();
		}.bind(this));

		function getUserInfo(evt){

		}

		function getAmount(evt){

		}

		this.on('mount', function(){
			store.dispatch(actions.createSignInRequest());
		});

		handlePaymentInstrument(){
			store.dispatch(actions.createPaymentInstrument());
		}

		handleChargeRequest(){
			store.dispatch(actions.createChargeRequest());
		}

		handleAuthorizeRequest(event){
			store.dispatch(actions.createAuthorizeRequest());
		}

		handleAccountStatusRequest(event){
			store.dispatch(actions.createAccountStatusRequest());
		}

		handleTransactionStatusRequest(event){
			store.dispatch(actions.createTransactionStatusRequest());
		}

		handleContactBillingShippingInfo(event){
			store.dispatch(actions.createUserInfo(event));
		}

		handleSubmit(event){

			this.handleContactBillingShippingInfo(event);
			this.handlePaymentInstrument();
			this.handleChargeRequest();
			
			store.dispatch(actions.submitPayment(id,isComplete));

		}
	</script>
</checkout-page>
