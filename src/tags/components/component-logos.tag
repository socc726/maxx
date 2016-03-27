<component-logos>
	<div each={img in this.state.images.images}>

		<img src="{img.src}" alt="{img.name}">

	</div>
	<script>
		var actions = require('./actions.js');
		var store = this._parent._parent.opts.store;

		store.subscribe(function(){
			this.state = store.getState();
			this.update();
		}.bind(this));

		this.on('mount', function(){
			store.dispatch(actions.createLogoImages());
			console.log(this);
		});
	</script>
	<style scoped>
	    img {
	      width: 10%;
	      vertical-align: middle;
	      padding:10px
	    }

  </style>
</component-logos>