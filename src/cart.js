module.exports = {
	cart: $storage
}

var ls = require('local-storage');
var move = require('move-js');
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
    removeItems: removeItems,
    moveUpCart: moveUpCart,
    moveDownCart: moveDownCart,
    exists: exists
  };

  return {
    'exists' : function(id){
      return core.exists(id);
    },
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
    'moveUpCart': function(height){
      return core.moveUpCart(height);
    },
    'moveDownCart': function(height){
      return core.moveDownCart(height);
    },
    'products': products(),
    'total': calculateTotal(),
    'quantity': calculateQuantity()
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
  moveDownCart();
}
function exists(id){
  for (var i = 0; i < cart.products.length; i++) {
    if(cart.products[i].id == id){
      return true;
    }
  }
  return false;
}
function increaseQuantity(id){
  for (var i = 0; i < cart.products.length; i++) {
    if(cart.products[i].id == id){
      cart.products[i].quantity++;
    }
  }
  ls.set(cartId, cart);
}

function decreaseQuantity(id){
  for (var i = 0; i < cart.products.length; i++) {
    if(cart.products[i].id == id){
      if(cart.products[i].quantity == 1){
        cart.products[i].quantity--;
        removeItemByIndex(i);
        return;
      }
      cart.products[i].quantity--;
    }
  }
  ls.set(cartId, cart);
}

function removeItem(id){
  for (var i = 0; i < cart.products.length; i++) {
    if(cart.products[i].id == id){
      cart.products[i].quantity = 0;
      cart.products.splice(i, 1);
    }
  }
  ls.set(cartId, cart);
}

function removeItemByIndex(index){
  cart.products.splice(index, 1);
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
  return total.formatMoney(2, '.', ',');
}

function calculateQuantity(){
  var quantity = 0;
  for (var i = 0; i < cart.products.length; i++) {
    quantity += cart.products[i].quantity;
  };
  return quantity;
}

function products(){
  return cart.products;
}

function moveDownCart(height){
  var pureMenuList = document.getElementById('PML');
  move(pureMenuList)
    .add('margin-top', height)
    .end();     
}

function moveUpCart(height){
  var pureMenuList = document.getElementById('PML');
  move(pureMenuList)
    .sub('margin-top', height)
    .end();     
}

Number.prototype.formatMoney = function(c, d, t){
    var n = this, 
    c = isNaN(c = Math.abs(c)) ? 2 : c, 
    d = d == undefined ? "." : d, 
    t = t == undefined ? "," : t, 
    s = n < 0 ? "-" : "", 
    i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", 
    j = (j = i.length) > 3 ? j % 3 : 0;
   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
 };