<products-page>
  <component-products exists={exists} movedown={moveDownProducts} add={addProductToCart} products={this.state.inventory}></component-products>
  <script>

    var actions = require('./actions.js');
    var componentActions = require('../components/actions.js');
    var store = this._parent.opts.store;

    store.subscribe(function(){
      this.state = store.getState();
      this.update();
    }.bind(this));

    this.on('mount', function(){
      store.dispatch(actions.getProductsFromInventory());
    });
    exists(id){
      return this.state.shoppingcart.exists(id);
    }
    addProductToCart(product){
        this.state.shoppingcart.post(product);
        store.dispatch(componentActions.getCart());
    }
    moveDownProducts(height){
      this.state.shoppingcart.moveDownCart(height);
    }
  </script>
</products-page>