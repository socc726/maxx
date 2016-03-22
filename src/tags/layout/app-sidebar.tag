<app-sidebar>

<sidebar-item links={this.state.sidebar.links} ></sidebar-item>

<script>
	var actions = require('./actions.js');
	var sharedActions = require('../shared/actions.js');
	var riotGearActions = require('../riotgear/actions.js');
	var store = this.opts.store;

	store.subscribe(function(){
		this.state = store.getState();
		this.update();
		console.log(this.state);
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
</style>
</app-sidebar>

