<component-shipping class="pure-u">
	
	<form id="Shipping" class="pure-form pure-form-stacked">
	    <fieldset>
	        <legend>Shipping Address</legend>

	        <div class="pure-g">
	            <div class="pure-u-1 pure-u-md-1-3">
	                <label for="shipCity">City</label>
	                <input id="shipCity" name="shipCity" class="pure-u-23-24" type="text">
	            </div>

	            <div class="pure-u-1 pure-u-md-1-3">
	                <label for="shipState">State</label>
	                <select id="shipState" name="shipState" class="pure-input-1-2">
	                    <option>AL</option>
	                    <option>CA</option>
	                    <option>IL</option>
	                </select>
	            </div>
	        </div>
	        <button type="submit" onclick={billSubmit} class="pure-button pure-button-primary">Submit</button>
	    </fieldset>
	</form>
	<script>
		var actions = require('./actions.js');
		var store = this._parent._parent.opts.store;

		store.subscribe(function(){
			this.state = store.getState();
			this.update();
		}.bind(this));
		
		this.on('mount', function(){
			console.log(this);
		});


    billSubmit(){
    	console.log(this);
    }
	</script>
</component-shipping>