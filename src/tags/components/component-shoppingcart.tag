<component-shoppingcart>

	
	<div class="shopping-cart" id="ShoppingCart">
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

	<style scoped>

		@keyframes resize {
		  from {opacity: 0}
		  to {opacity: 1}
		  0% {
		    padding: 0;
		  }
		  50% {
		    padding: 20px 20px;
		    background-color:rgba(255,0,0,0.2);
		  }
		  100% {
		    padding: 100px 100px;
		    background-color:rgba(255,0,0,0.9);
		  }
		}
		@keyframes resizeOut {
		  from{opacity:1;}
		  to{opacity: 0}
		  0% {
		    padding: 0 100px;
		    background-color:rgba(255,0,0,0.9);
		  }
		  50% {
		    padding: 0 20px;
		    background-color:rgba(255,0,0,0.2);
		  }
		  100% {
		    padding: 0 0px;
		  }
		}
		.shopping-cart{
			display: none;
		}
		.shopping-cart.active{
			display: table;
		}

	</style>
</component-shoppingcart>