<component-billing class="pure-u">
	
	<form id="Billing" class="pure-form pure-form-stacked">
	    <fieldset>
	        <legend>Billing Address</legend>

	        <div class="pure-g">
	            <div class="pure-u-1 pure-u-md-1-3">
	                <label for="billCity">City</label>
	                <input id="billCity" name="billCity" class="pure-u-23-24" type="text">
	            </div>

	            <div class="pure-u-1 pure-u-md-1-3">
	                <label for="billState">State</label>
	                <select id="billState" name="billState" class="pure-input-1-2">
	                    <option>AL</option>
	                    <option>CA</option>
	                    <option>IL</option>
	                </select>
	            </div>
	        </div>
        <label for="terms" class="pure-checkbox">
            <input id="terms" onclick={billSubmit} type="checkbox"> I've read the terms and conditions
        </label>
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
</component-billing>