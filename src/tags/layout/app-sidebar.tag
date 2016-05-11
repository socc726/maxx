<app-sidebar>

<a href="#menu" id="menuLink" class="menu-link active">
  <!-- Hamburger icon -->
  <span></span>
</a>
<div id="menu" class="active">
  <div class="pure-menu">

	<a class="pure-menu-heading" id="CartIcon" href="#">

		<i class="fa fa-shopping-cart fa-lg">
		</i>
		<span class="cart-item-quantity">{this.state.shoppingcart.quantity}</span>
		<span class="cart-total">${this.state.shoppingcart.total}</span>
	</a>

		<component-shoppingcart moveup={moveUpSidebar} id="ShoppingCart" class="animated	invisible" cart={this.state.shoppingcart}></component-shoppingcart>

	<ul class="pure-menu-list" id="PML">
		<sidebar-item links={this.state.sidebar.links} ></sidebar-item>
	</ul>
	<br>
	<br>

  <img src="./src/images/logo.jpg" class="maxx-logo" alt="">
	<p class="we-accept-all-cards">We accept all major credit cards.</p>

  </div>
</div>

<script>
	var actions = require('./actions.js');
	var sharedActions = require('../shared/actions.js');
	var riotGearActions = require('../riotgear/actions.js');
	var store = this.opts.store;
	var move = require('move-js');

	store.subscribe(function(){
		this.state = store.getState();
		this.update();
	}.bind(this));

	this.on('mount', function(){
		store.dispatch(actions.createSideBar());

		var layout = document.getElementById('layout'),
		    menu = document.getElementById('menu'),
		    menuLink = document.getElementById('menuLink'),
		    cartIcon = document.getElementById('CartIcon'),
		    pureMenuList = document.getElementById('PML'),
		    shoppingCart = document.getElementById('ShoppingCart'),
		    shoppingCartContainer = document.getElementById('ShoppingCartContainer'),
		    a = 0;

		function toggleClass(element, className) {
		    var classes = element.className.split(/\s+/),
		        length = classes.length,
		        i = 0;

		    for (; i < length; i++) {
		        if (classes[i] === className) {
		            classes.splice(i, 1);
		            break;
		        }
		    }
		    // The className is not found
		    if (length === classes.length) {
		        classes.push(className);
		    }

		    element.className = classes.join(' ');
		}

		function hasClass(el, className) {
		  if (el.classList)
		    return el.classList.contains(className)
		  else
		    return !!el.className.match(new RegExp('(\\s|^)' + className + '(\\s|$)'))
		}

		function addClass(el, className) {
		  if (el.classList)
		    el.classList.add(className)
		  else if (!hasClass(el, className)) el.className += " " + className
		}

		function removeClass(el, className) {
		  if (el.classList)
		    el.classList.remove(className)
		  else if (hasClass(el, className)) {
		    var reg = new RegExp('(\\s|^)' + className + '(\\s|$)')
		    el.className=el.className.replace(reg, ' ')
		  }
		}

		menuLink.onclick = function(e) {
		    var active = 'active';
		    e.preventDefault();
		    toggleClass(layout, active);
		    toggleClass(menu, active);
		    toggleClass(menuLink, active);
		}

		function fadeInOut(e){
			e.preventDefault();
			if(hasClass(shoppingCart, 'fadeInDown')){
				removeClass(shoppingCart, 'fadeInDown');
				addClass(shoppingCart, 'fadeOutUpBig');
				return;
			}
			if(hasClass(shoppingCart, 'fadeOutUpBig')){
				removeClass(shoppingCart, 'fadeOutUpBig');
				addClass(shoppingCart, 'fadeInDown');
				return;
			}
			addClass(shoppingCart, 'fadeInDown');
		}

		function moveDown(height){
			if(!height){
				console.dir(shoppingCartContainer);
				height = 330;
				height += (shoppingCartContainer.children.length - 2) * 180;
			}
			move(pureMenuList)
				.add('margin-top', height)
				.end();			
		}

		function moveUp(height){
			if(!height){
				var top = pureMenuList.style['marginTop'];
				height = parseInt(top, 10);
			}
			console.log(height + 'what');
			move(pureMenuList)
				.sub('margin-top', height)
				.end();			
		}

		function grow(e){
			e.preventDefault();
			if(hasClass(e.target.parentNode.parentNode.children[2], 'slideOutDown')){

				removeClass(pureMenuList, 'slideOutDown');
				addClass(pureMenuList, 'slideOutUp');
				return;
			}
			if(hasClass(e.target.parentNode.parentNode.children[2], 'slideOutUp')){
				removeClass(pureMenuList, 'slideOutUp');
				addClass(pureMenuList, 'slideOutDown');
				return;
			}
			addClass(pureMenuList, 'slideOutDown');
		}

		function handleEvent(e) {
			removeListeners();
			if(hasClass(shoppingCart, 'invisible')){
				removeClass(shoppingCart, 'invisible');
			}
			var height;
			if(typeof(e['detail']) == 'object'){
				height = e['detail'].height;
			}
			if(a == 0){
				a = 1;
				moveDown(height);
			}else{
				a = 0;
				moveUp(height);
			}
			toggleClass(shoppingCart, 'active');
			fadeInOut(e);
			setTimeout(function() {
      	addListeners();
      }, 1000);
		}

		function addListeners(){
			cartIcon.addEventListener('click', handleEvent, false);
			cartIcon.addEventListener('triggerClick', handleEvent, false);
		}

		function removeListeners(){
			cartIcon.removeEventListener('click', handleEvent, false);
			cartIcon.removeEventListener('triggerClick', handleEvent, false);
		}

		addListeners();
	});
	moveUpSidebar(height){
    this.state.shoppingcart.moveUpCart(height);
  }
</script>
<style scoped>
#menu::-webkit-scrollbar { 
    display: none; 
}

.we-accept-all-cards {
    color: white;
    text-align: center;
    bottom: 0;
    left: 0;
    right: 0;
    margin: 0;
    padding: 20px 0 10px;
    text-transform: uppercase;
    font-size: 9px;
}
#menu .pure-menu-selected, #menu .pure-menu-heading{
	background: #191818;
	position: relative;
	z-index: 999999999;
	padding-top:22px;
}
.fa-shopping-cart{
	position: relative;
	color: #E0E0E0;
}
.cart-total{
  position: absolute;
  right: 14px;
	color: #4E9455;
}
.cart-item-quantity{
		position: absolute;
    left: 26px;
    top: 14px;
    background: rgba(32, 61, 108, 0.88);
    border-radius: 84px;
    padding: 4px 4px;
    font-size: 10px;
    color: white;
    width: 12px;
    text-align: center;

}
@media (min-width: 480px) {
    .we-accept-all-cards {}
}
#ShoppingCart.invisible{
	visibility: hidden;
}
#ShoppingCart{
		display: block;
		position: absolute;
		top:50px;
}
#ShoppingCart.active{
	visibility: visible;
}
.maxx-logo{
	width:100%;
}
</style>
</app-sidebar>

