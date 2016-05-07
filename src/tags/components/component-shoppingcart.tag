<component-shoppingcart>

	
	<div class="shopping-cart" id="ShoppingCartContainer">
	    <div each={product in this.opts.cart.products}>

	        <img src="{product.images[0]}/resize/90" class="pure-img"/>
	        
	          <h2>{product.name}</h2>
	          <p class="price">${product.retailPrice}</p>
	    </div>
	</div>
		<button onclick={emptyCart}>Clear Items</button>

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


		emptyCart(){
			store.dispatch(actions.emptyCart());
		}
		
	</script>

</component-shoppingcart>