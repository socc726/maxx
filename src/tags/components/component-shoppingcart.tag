<component-shoppingcart>
	<button onclick={changeTotal}>Update Total</button>

	<script>
		var actions = require('./actions.js');
		var store = this._parent.opts.store;

		store.subscribe(function(){
			this.state = store.getState();
			this.update();
		}.bind(this));

		this.on('mount', function(){
			store.dispatch(actions.getCart());
		});

		changeTotal(){
			console.log(store);

			this.state.shoppingcart.post({id:"1",name:"Chikin", quantity:1, price:10});
			this.state.shoppingcart.post({id:"2",name:"Snowboard",quantity:1,price:36});
			store.dispatch(actions.getCart());
		}
		
	</script>
</component-shoppingcart>