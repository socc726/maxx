<products-page>
  <component-products products={this.state.inventory}></component-products>
  <script>

    var actions = require('./actions.js');
    var store = this._parent.opts.store;

    store.subscribe(function(){
      this.state = store.getState();
      this.update();
    }.bind(this));

    this.on('mount', function(){
      store.dispatch(actions.getProductsFromInventory());
    });
    this.on('umount', function(){
    });
  </script>
</products-page>