<component-hp>

	<div class="container container--super grid__cell--offset-5 grid__cell--width-90">
		<div class="grid__cell--offset-20 grid__cell--width-80">
		    <p class="hidden ecomId" style="display:none" >89f81c60-7457-431a-941d-3fd1c14c70dc</p>

		    <div id="HostedPaymentsV3"></div
		    <button onclick="handleSubmit"></button>	
		</div>
	</div>
	<script>
		var actions = require('./actions.js');
		var store = this._parent._parent.opts.store;

		store.subscribe(function(){
			this.state = store.getState();
			this.update();
		}.bind(this));

		this.on('mount', function(){
			store.dispatch(actions.createPaymentInstrument());
			console.log(this);
		});
		
		handleSubmit(evt){
			this.opts.handleSubmit(evt);
		}
	</script>
	<style scoped>
	    img {
	      width: 10%;
	      vertical-align: middle;
	      padding:10px
	    }

  </style>
</component-hp>