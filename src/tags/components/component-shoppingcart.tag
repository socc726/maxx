<component-shoppingcart>

	
	<div class="shopping-cart" id="ShoppingCartContainer">
	    <div class="cart-product animated zoomIn" each={product in this.opts.cart.products}>
	    		<i class="fa fa-minus quantity-minus" aria-hidden="true" onclick={minusItem}></i>
					<span class="quantity">{product.quantity}</span>
					<i class="fa fa-plus quantity-plus" aria-hidden="true" onclick={plusItem}></i>
	        <img src="{product.images[0]}/resize/90" class="pure-img"/>
	        
	          <h2>{product.name}</h2>
	          <p class="price">${product.retailPrice}</p>
						<i class="fa fa-recycle" aria-hidden="true" onclick={recycleItem}></i>
	    </div>
	    <div>
				<a href="/checkout" class="all-major-credit-cards">
				</a>
	    </div>
			<button class="button-error pure-button" onclick={emptyCart}>Clear Items</button>

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


		emptyCart(){
			store.dispatch(actions.emptyCart());
		}

		minusItem(e){
			store.dispatch(actions.minus(e.item.product.id));
		}

		plusItem(e){
			store.dispatch(actions.plus(e.item.product.id));
		}
		
		recycleItem(e){
			store.dispatch(actions.recycle(e.item.product.id));
		}
	</script>
	<style>
	.cart-product{
		margin: 10px;
    background: white;
    padding: 10px;
    position: relative;
    border-radius: 5px;
	}
	.cart-product .quantity{
		position: absolute;
    left: 23px;
    top: 6px;
    background: rgba(32, 61, 108, 0.88);
    border-radius: 84px;
    padding: 4px 4px;
    font-size: 10px;
    color: white;
    width: 12px;
    text-align: center;
	}
	.fa-recycle{
		font-size: 18px;
    cursor: pointer;
    color: #3370CE;
    position: absolute;
    top: 52px;
    left: 2px;
	}
	.cart-product .quantity-plus, .cart-product .quantity-minus{
		cursor: pointer;
    position: absolute;
		left: 4px;
	}
	.cart-product .quantity-plus{
		color:rgb(28, 184, 65);
    top: 10px;
	}
	.cart-product .quantity-minus{
		color:rgb(202, 60, 60);
		top: 31px;
	}
	.cart-product img{
		max-width: 100%;
    height: auto;
    display: block;
    text-align: center;
    margin: 20px auto 0;
	}
	.cart-product h2{
		font-size: 12px;
    text-align: center;
    text-decoration: underline;;
    cursor: pointer;
	}
	.cart-product p{
		text-align: center;
		margin: 0;
	}
	.cart-product .price{
		color:#4E9455;
		position: absolute;
    top: 7px;
    right: 5px;
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