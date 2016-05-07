module.exports = {
	cart: $storage
}

var ls = require('local-storage');
var cartId = 'MAXXCART';
var cart = ls.get(cartId);


function $storage() {

  if(!cart || !cart.hasOwnProperty('products')){
    cart = {};
    cart.products = [];
    ls.set(cartId, cart);
  }

  var core = {
    getItem: getItem,
    setItem: setItem,
    increaseQuantity: increaseQuantity,
    decreaseQuantity: decreaseQuantity,
    removeItem: removeItem,
    removeItems: removeItems
  };

  return {
    'get' : function(id){
      return core.getItem(id);
    },
    'post': function(item){
      return core.setItem(item);
    },
    'add': function(id){
      return core.increaseQuantity(id);
    },
    'subtract': function(id){
      return core.decreaseQuantity(id);
    },    
    'remove': function(id){
      return core.removeItem(id);
    },
    'clear': function(){
      return core.removeItems();
    },
    'products': products(),
    'total': calculateTotal()
  }
}

function getItem(id){
  for (var i = 0; i < cart.products.length; i++) {
    if(cart.products[i] == id){
      return cart.products[i];
    }
  }
}

function setItem(item){
  var exists = false;

  for (var i = 0; i < cart.products.length; i++) {
    if(cart.products[i].id == item.id){
      cart.products[i].quantity++;
      exists =true;
    }
  }

  if(!exists){
    item.quantity = 1;
    cart.products.push(item);
  }

  ls.set(cartId, cart);
}

function increaseQuantity(id){
  for (var i = 0; i < cart.products.length; i++) {
    if(cart.products[i] == id){
      cart.products[i].quantity++;
    }
  }
  ls.set(cartId, cart);
}

function decreaseQuantity(id){
  for (var i = 0; i < cart.products.length; i++) {
    if(cart.products[i] == id){
      cart.products[i].quantity--;
    }
  }
  ls.set(cartId, cart);
}

function removeItem(id){
  for (var i = 0; i < cart.products.length; i++) {
    if(cart.products[i] == id){
      cart.products.splice(i, 1);
    }
  }
  ls.set(cartId, cart);
}

function removeItems(){
  cart.products = [];
  ls.set(cartId, cart); 
}

function calculateTotal(){
  var total = 0;
  for (var i = 0; i < cart.products.length; i++) {
    total += ( cart.products[i].retailPrice * cart.products[i].quantity);
  };
  return parseFloat(total).toFixed(2);
}

function products(){
  return cart.products;
}