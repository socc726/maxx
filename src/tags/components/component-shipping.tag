<component-shipping show={ hide }>
	<h4>Shipping Address</h4>
	<div class="pure-form pure-form-stacked shipping-form">
	    <fieldset>
	    	<div class="pure-g">
        	<div class="pure-u-1 pure-u-md-8-24"></div>
        	<div class="pure-u-1 pure-u-md-8-24">
        		<label>Address</label>
            <input name="address" class="pure-u-23-24" type="text">
        	</div>
        	<div class="pure-u-1 pure-u-md-8-24"></div>
        </div>
        <div class="pure-g">
					<div class="pure-u-1 pure-u-md-8-24"></div>
					<div class="pure-u-1 pure-u-md-4-24">
              <label>City</label>
              <input name="city" class="pure-u-23-24" type="text">
          </div>
          <div class="pure-u-1 pure-u-md-2-24">
              <label>State</label>
              <select name="state" class="pure-u-23-24">
                  <option>AL</option>
                  <option>CA</option>
                  <option>IL</option>
              </select>
          </div>
          <div class="pure-u-1 pure-u-md-2-24">
          	
              <label>Zip</label>
              <input name="zip" class="pure-u-23-24" type="text">
          </div>
          <div class="pure-u-1 pure-u-md-8-24"></div>
        </div>
	    </fieldset>
	</div>
		<style scoped>
	.shipping-form{
		margin: 0 auto;
	}
		h4{
		margin-bottom: 0;
	}
</style>
</component-shipping>