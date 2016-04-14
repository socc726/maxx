<app-sidebar>

<a href="#menu" id="menuLink" class="menu-link active">
  <!-- Hamburger icon -->
  <span></span>
</a>
<div id="menu" class=" active">
  <div class="pure-menu">

    <a class="pure-menu-heading" href="#">
      <i class="fa fa-shopping-cart fa-lg"></i>
      <component-cart-count count={this.state.shoppingcart.count}></component-cart-count>
    </a>

    <ul class="pure-menu-list">
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
	var creditCards = document.get
	var store = this.opts.store;

	store.subscribe(function(){
		this.state = store.getState();
		this.update();
	}.bind(this));

	this.on('mount', function(){
		store.dispatch(actions.createSideBar());
		// document.getElementsByClassName("all-major-credit-cards")[0].addEventListener("click", function(event){
		// 	event.preventDefault();
		// window.location.href = "";
		// });
		var layout = document.getElementById('layout'),
		    menu = document.getElementById('menu'),
		    menuLink = document.getElementById('menuLink');

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

		menuLink.onclick = function(e) {
		    var active = 'active';

		    e.preventDefault();
		    toggleClass(layout, active);
		    toggleClass(menu, active);
		    toggleClass(menuLink, active);
		};
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
</style>
</app-sidebar>

