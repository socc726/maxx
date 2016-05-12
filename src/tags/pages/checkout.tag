<checkout-page>
		<component-contact></component-contact>

		<component-shipping address={this.state.shippingAddress}>
		</component-shipping>

		<component-billing address={this.state.billingAddress == null ? this.state.shippingAddress : this.state.billingAddress}>
		</component-billing>

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

		handlePaymentInstrument(userInfo){
			store.dispatch(actions.createPaymentInstrument(userInfo));
		}

		handleChargeRequest(amount){
			store.dispatch(actions.createChargeRequest(amount));
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
		collectContactBillingShippingInfo(event){
			store.dispatch(actions.createUserInfo(event));
		}
		handleSubmit(event){
			this.collectContactBillingShippingInfo(event);
			if(this.state.shippingAddress.isValid && this.state.billingAddress.isValid){
				this.handlePaymentInstrument(getUserInfo(event));
				this.handleChargeRequest(getAmount(event));
				store.dispatch(actions.submitPayment(id,isComplete));
			}
		}
	</script>
</checkout-page>
