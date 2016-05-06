<component-shoppingcart>

	
	<div class="shopping-cart pure-g" id="ShoppingCart">
	    <div class="pure-u-1-1" each={product in this.opts.cart.products}>

	        <img src="{product.images[0]}/resize/90" class="pure-img"/>
	        
	          <h2>{product.name}</h2>
	          <p class="price">${product.retailPrice}</p>
	    </div>
		<button onclick={emptyCart}>Clear Items</button>
	</div>

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
			animation-name: resizeOut;
			animation-duration: 1s;
			animation-iteration-count: 1;
			animation-timing-function: ease-out;
		}
		.shopping-cart.active{
			display: table;
			animation-name: resize;
			animation-duration: 1s;
			animation-iteration-count: 1;
			animation-timing-function: ease-in-out;
			padding: 100px 100px;
			background-color:rgba(255,0,0,0.9);
		}

	</style>
</component-shoppingcart>