<component-billing>
	
	<div class="pure-form pure-form-stacked billing-form">
	    <fieldset>
	        <legend>Billing Address</legend>

	        <div class="pure-g">
	        		<div class="pure-u-1 pure-u-md-1-3"></div>
	            <div class="pure-u-1 pure-u-md-1-3">
	                <label>Address</label>
	                <input name="address" class="pure-u-23-24" type="text">
	            </div>
							<div class="pure-u-1 pure-u-md-1-3"></div>
							<div class="pure-u-1 pure-u-md-1-4"></div>
							<div class="pure-u-1 pure-u-md-1-4">
	                <label>City</label>
	                <input name="city" class="pure-u-23-24" type="text">
	            </div>
	            <div class="pure-u-1 pure-u-md-1-4">
	                <label>State</label>
	                <select name="state" class="pure-input-1-2">
	                    <option>AL</option>
	                    <option>CA</option>
	                    <option>IL</option>
	                </select>
	            </div>					
							<div class="pure-u-1 pure-u-md-1-4">
	                <label>Zip</label>
	                <input name="zip" class="pure-input-1-2" type="text">
	            </div>

	        </div>
        <label for="terms" class="pure-checkbox">
            <input id="terms" onclick={billSubmit} type="checkbox"> I've read the terms and conditions
        </label>
	    </fieldset>
	</div>
	<style scoped>
	.billing-form{
		margin: 0 auto;
	}

</style>
</component-billing>