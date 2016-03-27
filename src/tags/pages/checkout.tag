<checkout-page>
	<component-shipping address={this.state.shippingAddress}>
	</component-shipping>

	<component-billing address={this.state.billingAddress == null ? this.state.shippingAddress : this.state.billingAddress}>
	</component-billing>

	<component-hp customer={this.state.customer} handleSubmit={handleSubmit}>

	</component-hp>

	<script>

	    var actions = require('./actions.js');
	    var store = this._parent.opts.store;

		this.on('mount', function(){
			store.dispatch(actions.loadHostedPayments());
		});

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
