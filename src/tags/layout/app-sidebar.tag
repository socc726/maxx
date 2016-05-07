<app-sidebar>

<a href="#menu" id="menuLink" class="menu-link active">
  <!-- Hamburger icon -->
  <span></span>
</a>
<div id="menu" class="active">
  <div class="pure-menu">

	<a class="pure-menu-heading" id="CartIcon" href="#">
		<i class="fa fa-shopping-cart fa-lg"></i>
		<span>${this.state.shoppingcart.total}</span>
	</a>

		<component-shoppingcart id="ShoppingCart" class="animated	hidden" cart={this.state.shoppingcart}></component-shoppingcart>

	<ul class="pure-menu-list" id="PML">
		<sidebar-item links={this.state.sidebar.links} ></sidebar-item>
	</ul>

	<br>
	<br>

	<a href="/checkout" class="all-major-credit-cards">
	</a>

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
		    shoppingCartContainer = document.getElementById('ShoppingCartContainer');

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
			console.log(e);
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
		function moveDown(){
			move(pureMenuList)
				.add('margin-top', shoppingCartContainer.offsetHeight)
				.end();			
		}
		function moveUp(){
			move(pureMenuList)
				.sub('margin-top', shoppingCartContainer.offsetHeight)
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
		var a = 0;
		cartIcon.onclick = function(e){
			console.dir(shoppingCartContainer);
			if(hasClass(shoppingCart, 'hidden')){
				removeClass(shoppingCart, 'hidden');
			}
			
			if(a == 0){
				a = 1;
				moveDown();
			}else{
				a = 0;
				moveUp();
			}
			toggleClass(shoppingCart, 'active');
			fadeInOut(e);
		}
	});
</script>
<style scoped>
.all-major-credit-cards {
    background: url('./src/images/all_major_credit_cards.png');
    height: 13%;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
    margin: 0 auto;
    overflow: hidden;
    position: absolute;
    bottom: 50px;
    left: 0;
    width: 100%;
    box-sizing: border-box;
    opacity: .5;
    cursor: pointer;
}
.all-major-credit-cards:hover {
    opacity: 1
}
.we-accept-all-cards {
    color: white;
    text-align: center;
    bottom: 0;
    left: 0;
    right: 0;
    margin: 0;
    padding: 20px 0 10px;
    position: absolute;
    text-transform: uppercase;
    font-size: 9px;
}
@media (min-width: 480px) {
    .we-accept-all-cards {}
}
#ShoppingCart.hidden{
	visibility: hidden;
}
#ShoppingCart{
		display: block;
		position: absolute;
		top:30px;
}
#ShoppingCart.active{
	visibility: visible;
}
</style>
</app-sidebar>

