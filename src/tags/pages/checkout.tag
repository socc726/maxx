<checkout-page>
	<script>
	    var actions = require('./actions.js');
	    var store = this._parent.opts.store;
		this.on('mount', function(){
			store.dispatch(actions.loadHostedPayments());
		});
	</script>
</checkout-page>
