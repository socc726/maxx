<checkout-page>
	<button onclick={handlePaymentInstrument}>Create Payment Instrument</button>
	<component-shipping address={this.state.shippingAddress}>
	</component-shipping>

	<component-billing address={this.state.billingAddress == null ? this.state.shippingAddress : this.state.billingAddress}>
	</component-billing>

	<component-hp customer={this.state.customer} handleSubmit={handleSubmit}>

	</component-hp>

	<script>

	    var actions = require('./actions.js');
	    var store = this._parent.opts.store;

		store.subscribe(function(){
			this.state = store.getState();
			this.update();
		}.bind(this));

		this.on('mount', function(){
			console.log('baker');
			store.dispatch(actions.createSignInRequest());
		});

		handlePaymentInstrument(event){
			store.dispatch(actions.createPaymentInstrument());
		}
		
		handleSubmit(event){
			if(this.state.shippingAddress.isValid && this.state.billingAddress.isValid){
				store.dispatch(actions.submitPayment(id,isComplete));
			}
		}
		this.on('umount', function(){
			console.log('freshbt')
		});
	</script>
</checkout-page>
