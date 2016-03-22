<app-sidebar>

<sidebar-item links={this.state.sidebar.links} ></sidebar-item>
<br>
<br>
<div class="all-major-credit-cards">
</div>
<p class="we-accept-all-cards">We accept all major credit cards.</p>

<script>
	var actions = require('./actions.js');
	var sharedActions = require('../shared/actions.js');
	var riotGearActions = require('../riotgear/actions.js');
	var store = this.opts.store;

	store.subscribe(function(){
		this.state = store.getState();
		this.update();
	}.bind(this));

	this.on('mount', function(){
		store.dispatch(actions.createSideBar());
	});
</script>
<style scoped>
	:scope {
		position: fixed;
		top: 0;
		left: 0;
		height: 100%;
		box-sizing: border-box;
		font-family: sans-serif;
		text-align: left;
		color: #666;
		background: #333;
		width: 16%;
		transition: width .2s;
	}
	:scope:hover {
		width: 25%;
	}
	a {
		display: block;
		overflow: hidden;
		box-sizing: border-box;
		width: 100%;
		height: 50px;
		line-height: 50px;
		padding: 0 .8em;
		color: white;
		text-decoration: none;
		background: #444;
	}
	a:hover {
		background: #666;
	}
	a.selected {
		background: teal;
	}
	.all-major-credit-cards{
		background: url('./src/images/all_major_credit_cards.png');
	    height: 13%;
	    background-size: contain;
	    background-repeat: no-repeat;
	    background-position: center center;
	    margin: 0 auto;
	    overflow: hidden;
	    position:absolute;
	    bottom: 50px;
	    left: 0;
	    width:100%;
		box-sizing: border-box;
		opacity: .5;
		cursor: pointer;
	}
	.all-major-credit-cards:hover{
		opacity: 1
	}	
	.we-accept-all-cards{
		color:white;
		text-align: center;
		bottom:0;
		left: 0;
		right: 0;
		margin:0;
		padding: 20px 0 10px;
	    position:absolute;
	    text-transform: uppercase;
	}
    @media (min-width: 480px) {
      .we-accept-all-cards {
      	font-size:9px;
      }
    }	
</style>
</app-sidebar>

