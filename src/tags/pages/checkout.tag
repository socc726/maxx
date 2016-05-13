<checkout-page>

	<component-contact></component-contact>

	<component-billing handlecheck={handleShippingCheck}>
	</component-billing>

	<component-shipping hide={this.state.hosted.sameAs}>
	</component-shipping>

	<component-hp customer={this.state.customer} handlesubmit={handleSubmit}>
	</component-hp>

	<script>

	  var actions = require('./actions.js');
	  var store = this._parent.opts.store;

		store.subscribe(function(){
			this.state = store.getState();
			this.update();
		}.bind(this));

		handleShippingCheck(checked){
			store.dispatch(actions.toggleShipping(checked));
			console.log(this);
		}

		this.on('mount', function(){
			store.dispatch(actions.createSignInRequest());
		});

		handlePaymentInstrument(){
			store.dispatch(actions.createPaymentInstrument());
		}

		handleChargeRequest(a){
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

		}
	</script>
</checkout-page>
