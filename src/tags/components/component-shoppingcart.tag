<component-shoppingcart>

	
	<div class="shopping-cart" id="ShoppingCartContainer">
	    <div class="cart-product" each={product in this.opts.cart.products}>

	        <img src="{product.images[0]}/resize/90" class="pure-img"/>
	        
	          <h2>{product.name}</h2>
	          <p class="price">${product.retailPrice}</p>
	    </div>
	    <div>
				<a href="/checkout" class="all-major-credit-cards">
				</a>
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
	<style>
	.cart-product{
		    margin: 10px;
    background: white;
    padding: 10px;
    border-radius: 5px;
	}
	.cart-product img{
		    max-width: 100%;
    height: auto;
    display: block;
    text-align: center;
    margin: 0 auto;
	}
	.cart-product h2{
		font-size: 12px;
    text-align: center;
	}
	.cart-product p{
		text-align: center;
	}
	#menu a.all-major-credit-cards {
    background: url('./src/images/all_major_credit_cards.png');
    padding:100px;
    height:50%;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
    margin: 0 auto;
    overflow: hidden;
    bottom: 50px;
    display: table;
    width: 100%;
    box-sizing: border-box;
    opacity: .5;
    cursor: pointer;
	}
	#menu a.all-major-credit-cards:hover {
	    opacity: 1
	}
	</style>
</component-shoppingcart>