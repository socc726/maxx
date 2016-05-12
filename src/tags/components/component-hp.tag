<component-hp>
	<div class="hp-iframe">
	    <div class="hp hp-form hp-active hp-form-cc hp-form-desktop">
	        <div class="hp-loading-container"><span class="hp-loading-text">Loading</span>
	            <div class="hp-loading"><span></span><span></span><span></span><span></span></div>
	        </div>
	        <div class="hp-row pure-g">
	            <div class="hp-col hp-col-left pure-u-1 pure-u-sm-8-24 pure-u-md-8-24 pure-u-lg-1-4">
	                <ul class="hp-nav">
	                	<li class="hp-type hp-cc"><a href="javascript:void(0);"><i></i> <span>Credit Card</span></a></li>
	                </ul>
	                <div class="hp-support"><strong>Help &amp; support</strong>
	                    <p>Having issues with your payments? Call us at 800-834-7790.</p>
	                </div>
	                <div class="hp-secure"><a class="hp-secure-icon" href="https://www.etsms.com/" target="_blank" title="ETS - Electronic Transaction Systems">Powered By ETS</a></div>
	                <div class="hp-version"><small class="hp-version"><span class="">Transaction Amount: <span class="hp-version-amount">$38.00</span></span><br>Hosted Payments v3.1.0</small></div>
	            </div>
	            <div class="hp-col hp-col-right pure-u-1 pure-u-sm-16-24 pure-u-md-16-24 pure-u-lg-3-4">
	                <div class="hp-content hp-content-cc hp-content-active">
	                	<div class="card-wrapper"></div>
	                	<br>
	                	<br>
									<form class="hp-input-wrapper" onsubmit={handleSubmit}>
										<div class="hp-input hp-input-cc">
											<input placeholder="Enter Card Number" type="text" name="number">
										</div>
										<div class="hp-input hp-input-name">
											<input placeholder="Enter Full Name" type="text" name="name"/>
										</div>
										<div class="hp-input hp-input-cc">
											<input placeholder="07/26" type="text" name="expiry"/>
										</div>
										<div class="hp-input hp-input-third hp-input-cvv hp-input-name">
											<input placeholder="Enter CVV" type="text" name="cvc"/>
											<span class="hp-input-cvv-image"></span>
										</div>
										<div class="hp-break"></div>
										<br>
										<button class="hp-submit" type="submit">Submit Payment</button>
									</form>
	                </div>
<!-- 			                <div class="hp-content hp-content-success">
	                    <div class="hp-success-visual"></div>
	                    <h2>Transaction Complete!</h2>
	                    <p class="text-muted">You are being redirected...</p>
	                </div> -->
	            </div>
	        </div>
	    </div>
	</div>

	<script>
		var actions = require('./actions.js');
		var $ = require("jquery");
		window.jQuery = $;
		require('card');
		var store = this._parent._parent.opts.store;

		store.subscribe(function(){
			this.state = store.getState();
			this.update();
		}.bind(this));
		
		this.on('mount', function(){
			$( document ).ready(function() {
				var card = new Card({
					form: 'form.hp-input-wrapper',
					container: '.card-wrapper',

					placeholders: {
						number: '**** **** **** ****',
						name: 'Name On Card',
						expiry: '**/**',
						cvc: '***'
					},
					debug: true
				});
			});
			// create payment instrument

			// 
		});
		
		handleSubmit(evt){
			console.log(evt);
			evt.preventDefault();
			this.opts.handlesubmit(evt);
		}

	</script>


	<style scoped>
		img {
			width: 10%;
			vertical-align: middle;
			padding:10px
		}
		.hp .hp-col-left .hp-nav .hp-type.hp-bank a i, .hp .hp-col-left .hp-nav .hp-type.hp-cc a i, .hp .hp-col-left .hp-nav .hp-type.hp-code a i, .hp .hp-col-left .hp-nav .hp-type.hp-emoney a i, .hp .hp-col-left .hp-nav .hp-type.hp-transvault a i, .hp .hp-col-left .hp-secure .hp-secure-icon, .hp .hp-col-right .hp-bank-visual .hp-bank-visual-image, .hp .hp-col-right .hp-content-bank .hp-code-image, .hp .hp-col-right .hp-content-bank .hp-input-cvv-image, .hp .hp-col-right .hp-content-bank.hp-content-card-amex .hp-input-cvv-image, .hp .hp-col-right .hp-content-card-amex .hp-card-visual, .hp .hp-col-right .hp-content-card-discover .hp-card-visual, .hp .hp-col-right .hp-content-card-emoney .hp-card-visual, .hp .hp-col-right .hp-content-card-jcb .hp-card-visual, .hp .hp-col-right .hp-content-card-mastercard .hp-card-visual, .hp .hp-col-right .hp-content-card-visa .hp-card-visual, .hp .hp-col-right .hp-content-cc .hp-code-image, .hp .hp-col-right .hp-content-cc .hp-input-cvv-image, .hp .hp-col-right .hp-content-cc.hp-content-card-amex .hp-input-cvv-image, .hp .hp-col-right .hp-content-code .hp-code-image, .hp .hp-col-right .hp-content-code .hp-input-cvv-image, .hp .hp-col-right .hp-content-code.hp-content-card-amex .hp-input-cvv-image, .hp .hp-col-right .hp-content-emoney .hp-code-image, .hp .hp-col-right .hp-content-emoney .hp-input-cvv-image, .hp .hp-col-right .hp-content-emoney.hp-content-card-amex .hp-input-cvv-image, .hp .hp-col-right .hp-content-transvault .hp-code-image, .hp .hp-col-right .hp-content-transvault .hp-input-cvv-image, .hp .hp-col-right .hp-content-transvault.hp-content-card-amex .hp-input-cvv-image, .hp .hp-col-right .hp-content.hp-content-emoney .hp-emoney-image, .hp .hp-col-right .hp-content.hp-content-emoney .hp-emoney-logo, .hp .hp-col-right .hp-transvault-visual .hp-transvault-visual-image, .hp .hp-col-right .hp-transvault-visual .hp-transvault-visual-image.alt, .hp .hp-splitable .hp-splitable-item .hp-splitable-cardtype.hp-splitable-cardtype-ach, .hp .hp-splitable .hp-splitable-item .hp-splitable-cardtype.hp-splitable-cardtype-amex, .hp .hp-splitable .hp-splitable-item .hp-splitable-cardtype.hp-splitable-cardtype-discover, .hp .hp-splitable .hp-splitable-item .hp-splitable-cardtype.hp-splitable-cardtype-emoney, .hp .hp-splitable .hp-splitable-item .hp-splitable-cardtype.hp-splitable-cardtype-jcb, .hp .hp-splitable .hp-splitable-item .hp-splitable-cardtype.hp-splitable-cardtype-mastercard, .hp .hp-splitable .hp-splitable-item .hp-splitable-cardtype.hp-splitable-cardtype-tv, .hp .hp-splitable .hp-splitable-item .hp-splitable-cardtype.hp-splitable-cardtype-tv.active, .hp .hp-splitable .hp-splitable-item .hp-splitable-cardtype.hp-splitable-cardtype-visa, .hp .hp-splitable.hp-splitable-collapsed>a.hp-splitable-arrow, .hp .hp-splitable>a.hp-splitable-arrow, .hp-form-success .hp-success-visual, .hp-input-overlay .hp-input-close, .hp-input-overlay .wallet.wallet-ach, .hp-input-overlay .wallet.wallet-amex, .hp-input-overlay .wallet.wallet-discover, .hp-input-overlay .wallet.wallet-emoney, .hp-input-overlay .wallet.wallet-jcb, .hp-input-overlay .wallet.wallet-master, .hp-input-overlay .wallet.wallet-visa, .sprites-sprite {
			background-image: url('../../../src/images/hp.png');
			background-repeat: no-repeat;
		}
		.hp a, .hp abbr, .hp acronym, .hp address, .hp applet, .hp article, .hp aside, .hp audio, .hp b, .hp big, .hp blockquote, .hp canvas, .hp caption, .hp center, .hp cite, .hp code, .hp dd, .hp del, .hp details, .hp dfn, .hp div, .hp dl, .hp dt, .hp em, .hp embed, .hp fieldset, .hp figcaption, .hp figure, .hp footer, .hp form, .hp h1, .hp h2, .hp h3, .hp h4, .hp h5, .hp h6, .hp header, .hp hgroup, .hp i, .hp iframe, .hp img, .hp ins, .hp kbd, .hp label, .hp legend, .hp li, .hp mark, .hp menu, .hp nav, .hp object, .hp ol, .hp output, .hp p, .hp pre, .hp q, .hp ruby, .hp s, .hp samp, .hp section, .hp small, .hp span, .hp strike, .hp strong, .hp sub, .hp summary, .hp sup, .hp table, .hp tbody, .hp td, .hp tfoot, .hp th, .hp thead, .hp time, .hp tr, .hp tt, .hp u, .hp ul, .hp var, .hp video 
		{
			margin: 0;
			padding: 0;
			border: 0;
			font-size: 100%;
			vertical-align: baseline;
		}

		.hp-iframe {
			display: table;
			margin: 0 auto;
		}

		.hp {
			display: table;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
			-moz-user-select: -moz-none;
			-ms-user-select: none;
			-webkit-user-select: none;
			user-select: none;
			-moz-border-radius: 3px;
			-webkit-border-radius: 3px;
			border-radius: 3px;
			font-family: "Segoe UI Light","Segoe UI","Selawik Light",Arial,sans-serif;
			font-weight: 400;
			font-size: 16px!important;
			background: #FDFDFD;
			position: relative;
			border: 1px solid #f3f3f3;
		}

		.hp .hp-loading-container {
			box-shadow: inset 1px 1px 0 #f3f3f3,inset -1px -1px 0 #f3f3f3;
			position: absolute;
			display: none;
			z-index: 10;
		}

		.hp .hp-loading-container .hp-loading-text {
			position: absolute;
			top: 50%;
			left: 50%;
			text-align: center;
			text-transform: uppercase;
			color: #007aff;
		}

		.hp .hp-loading-container .hp-loading {
			position: absolute;
			line-height: 40px;
			top: 50%;
			left: 50%;
		}

		.hp .hp-loading-container .hp-loading span {
			display: inline-block;
			vertical-align: middle;
			width: 8px;
			height: 8px;
			margin: 2.67px;
			border-radius: 50%;
			z-index: 10;
			background: #4285f4;
			-moz-animation: hp-loading .4s infinite alternate;
			-webkit-animation: hp-loading .4s infinite alternate;
			animation: hp-loading .4s infinite alternate;			
		}

		.hp .hp-loading-container .hp-loading span:nth-of-type(2) {
			background: #db4437;
			-moz-animation-delay: .2s;
			-webkit-animation-delay: .2s;
			animation-delay: .2s;			
		}

		.hp .hp-loading-container .hp-loading span:nth-of-type(3) {
			background: #f4b400;
			-moz-animation-delay: .4s;
			-webkit-animation-delay: .4s;
			animation-delay: .4s;
		}

		.hp .hp-loading-container .hp-loading span:nth-of-type(4) {
			background: #0f9d58;
			-moz-animation-delay: .6s;
			-webkit-animation-delay: .6s;
			animation-delay: .6s;			
		}

		.hp .hp-row {
			-moz-box-sizing: border-box;
			box-sizing: border-box;
			-moz-border-radius: 3px;
			-webkit-border-radius: 3px;
			border-radius: 3px;
			background: 0 0;		
		}

		.hp .hp-col {
			box-sizing: border-box;
			float: left;
		}
		.hp .hp-col-left .hp-nav a, .hp .hp-col-left .hp-secure a, .hp .hp-col-left .hp-support a, .hp .hp-col-left .hp-version a {
			font-weight: 800;
		}
		.hp .hp-col-left .hp-nav, .hp .hp-col-left .hp-secure, .hp .hp-col-left .hp-support, .hp .hp-col-left .hp-version {
			margin: 15px;
		}

		.hp .hp-col-left {
			text-align: left;
			margin: 13px 0;
			border-right: 1px solid #9CA3B3;	
		}

		.hp .hp-col-left .hp-nav {
			list-style: none;
			margin-top: 6px;
		}
		.hp .hp-col-left .hp-nav .hp-type {
			margin-bottom: 20px;
		}
		.hp a, .hp a:focus, .hp a:link, .hp a:visited {
			color: #007aff;
			text-decoration: none;			
		}

		.hp .hp-col-left .hp-nav .hp-type a {
			position: relative;
			display: block;
			text-indent: 40px;
		}

		.hp .hp-col-left .hp-nav .hp-type a i {
			position: absolute;
			left: 0;
			top: 50%;
			margin-top: -16px;
		}

		.hp .hp-col-left .hp-nav .hp-type.hp-cc a i {
			background-position: 0 -490px;
			height: 32px;
			width: 32px;
		}

		.hp .hp-col-left .hp-secure {
			border-top: 1px solid #9CA3B3;
			position: relative;
			z-index: 9;
		}

		.hp .hp-col-left .hp-secure .hp-secure-icon {
			background-position: 0 -4306px;
			text-indent: -119988px;
			overflow: hidden;
			text-align: left;
			text-transform: capitalize;
			height: 48px;
			width: 92px;
			margin-top: 15px;
			margin-bottom: 25px;
			display: block;			
		}

		.hp .hp-col-left .hp-version {
			position: absolute;
			bottom: 0;
			width: 100%;			
		}

		.hp .hp-col-left .hp-nav small, .hp .hp-col-left .hp-secure small, .hp .hp-col-left .hp-support small, .hp .hp-col-left .hp-version small {
			color: #007aff;
			font-size: 11px;
			margin: 49px 0 0;
			padding: 0;
			display: block;			
		}


		.hp .hp-col-right .hp-content {
			-moz-box-sizing: border-box;
			-webkit-box-sizing: border-box;
			box-sizing: border-box;
			display: table;
			margin: 0 auto;
			padding: 22px 13px;
			min-height: 485px;			
		}
		.hp .hp-col-right .hp-card-visual{
			-moz-box-sizing: border-box;
			-webkit-box-sizing: border-box;
			box-sizing: border-box;
			-moz-border-radius: 30px;
			-webkit-border-radius: 30px;
			border-radius: 30px;
			background: url('../../../src/images/card-back.svg');
			background: -moz-linear-gradient(135deg,#9ca3b3,#b9bec9);
			background: -webkit-linear-gradient(135deg,#9ca3b3,#b9bec9);
			background: linear-gradient(-45deg,#9ca3b3,#b9bec9);
			-moz-box-shadow: 0 4px 3px rgba(0,0,0,.1),0 8px 13px rgba(0,0,0,.1),0 18px 23px rgba(0,0,0,.1),inset 0 1px 0 rgba(255,255,255,.25);
			-webkit-box-shadow: 0 4px 3px rgba(0,0,0,.1),0 8px 13px rgba(0,0,0,.1),0 18px 23px rgba(0,0,0,.1),inset 0 1px 0 rgba(255,255,255,.25);
			box-shadow: 0 4px 3px rgba(0,0,0,.1),0 8px 13px rgba(0,0,0,.1),0 18px 23px rgba(0,0,0,.1),inset 0 1px 0 rgba(255,255,255,.25);
			border: 1px solid #7f889d;
			display: block;
			height: 236px;
			width: 100%;
			position: relative;
			margin: 0 auto;			
		}
		.jp-card-container{
			width: 100%;
		}
		.jp-card{
			height: 236px;
			width: 100%;
		}
		.jp-card .jp-card-front, .jp-card .jp-card-back{
			-moz-box-sizing: border-box;
			-webkit-box-sizing: border-box;
			box-sizing: border-box;
			-moz-border-radius: 30px;
			-webkit-border-radius: 30px;
			border-radius: 30px;
			background: url('../../../src/images/card-back.svg');
			background: -moz-linear-gradient(135deg,#9ca3b3,#b9bec9);
			background: -webkit-linear-gradient(135deg,#9ca3b3,#b9bec9);
			background: linear-gradient(-45deg,#9ca3b3,#b9bec9);
			-moz-box-shadow: 0 4px 3px rgba(0,0,0,.1),0 8px 13px rgba(0,0,0,.1),0 18px 23px rgba(0,0,0,.1),inset 0 1px 0 rgba(255,255,255,.25);
			-webkit-box-shadow: 0 4px 3px rgba(0,0,0,.1),0 8px 13px rgba(0,0,0,.1),0 18px 23px rgba(0,0,0,.1),inset 0 1px 0 rgba(255,255,255,.25);
			box-shadow: 0 4px 3px rgba(0,0,0,.1),0 8px 13px rgba(0,0,0,.1),0 18px 23px rgba(0,0,0,.1),inset 0 1px 0 rgba(255,255,255,.25);
			border: 1px solid #7f889d;
			display: block;
			height: 236px;
			width: 100%;
			margin: 0 auto;	
		}

		.jp-card.jp-card-identified .jp-card-front:before, .jp-card.jp-card-identified .jp-card-back:before {
			border-radius: 30px;
			-webkit-transition: none;
		}
		.jp-card.jp-card-identified{
			border-radius: 30px;
		}
		.jp-card.jp-card-identified .jp-card-front:before{
			background-image: url('../../../src/images/hp.png');
			background-repeat: no-repeat;
			background-position: fixed;
		}
		.jp-card.jp-card-visa.jp-card-identified .jp-card-front:before, .jp-card.jp-card-visa.jp-card-identified .jp-card-back:before{    
			background-position: 0 -4354px;
			border: 1px solid #02202d;
			background-color: #002952;
		}
		.jp-card.jp-card-mastercard.jp-card-identified .jp-card-front:before, .jp-card.jp-card-mastercard.jp-card-identified .jp-card-back:before{
			background-position: 0 -2763px;
			border: 1px solid #141229;
			background-color: #2E2E2E;
		}
		.jp-card.jp-card-discover.jp-card-identified .jp-card-front:before, .jp-card.jp-card-discover.jp-card-identified .jp-card-back:before{
			background-position: 0 -1040px;
			border: 1px solid #3b7591;
			background-color: #FF9047;
		}
		.jp-card.jp-card-amex.jp-card-identified .jp-card-front:before, .jp-card.jp-card-amex.jp-card-identified .jp-card-back:before{
			background-position: 0 -111px;
			border: 1px solid #122c26;
			background-color: #3F9884;
		}
		.jp-card.jp-card-dinersclub.jp-card-identified .jp-card-front:before, .jp-card.jp-card-dinersclub.jp-card-identified .jp-card-back:before{
			background-image: none;
			border: 1px solid #141229;
		}
		.jp-card.jp-card-jcb.jp-card-identified .jp-card-front:before, .jp-card.jp-card-jcb.jp-card-identified .jp-card-back:before{
			background-position: 0 -2419px;
			border: 1px solid #141229;
			background-color: #d29b43;
		}

		.jp-card.jp-card-elo.jp-card-identified .jp-card-front:before, .jp-card.jp-card-elo.jp-card-identified .jp-card-back:before{
			background-image: none;
			background: -moz-linear-gradient(135deg,#9ca3b3,#b9bec9);
			background: -webkit-linear-gradient(135deg,#9ca3b3,#b9bec9);
			background: linear-gradient(-45deg,#9ca3b3,#b9bec9);
		}
		.jp-card.jp-card-elo.jp-card-identified .jp-card-logo.jp-card-elo {
			opacity: 0;
		}
		.hp .hp-col-right .hp-card-visual .hp-card-visual-number {
			top: 100px;
			left: 35px;			
		}
		.hp .hp-col-right .hp-card-visual .hp-card-visual-name {
			font-size: 23px;
			bottom: 50px;
			left: 35px;
			font-weight: 400;
			text-transform: uppercase			
		}
		.hp .hp-col-right .hp-card-visual .hp-card-visual-expiry {
			bottom: 45px;
			right: 15px;
			width: 75px;			
		}
		.hp .hp-col-right .hp-card-visual .hp-card-visual-expiry-label {
			top: -40px;
		}
		.hp .hp-col-right .hp-card-visual .hp-card-visual-expiry-label-alt {
			width: 45px;
			text-align: right;
			left: -52px;
			top: -28px;
		}
		.hp .hp-col-right .hp-card-visual .hp-card-visual-expiry-value {
			position: absolute;
			font-size: 22px;
			text-transform: uppercase;
			top: -30px;
		}
		.hp .hp-col-right .hp-card-visual .hp-card-visual-expiry-label, .hp .hp-col-right .hp-card-visual .hp-card-visual-expiry-label-alt {
			position: absolute;
			font-size: 9px;
			text-transform: uppercase;
			font-weight: 400;
		}
		.hp .hp-col-right .hp-card-visual>div {
			text-shadow: 0 2px 2px rgba(0,0,0,.15);
			-moz-transition: all 150ms linear;
			-o-transition: all 150ms linear;
			-webkit-transition: all 150ms linear;
			transition: all 150ms linear;
			position: absolute;
			font-size: 29px;
			text-align: left;
			font-family: "Bitstream Vera Sans Mono",Consolas,Courier,monospace;
			font-weight: 800;
			color: #fff;
		}
		.hp .hp-input-wrapper {
			margin: 24px auto 0;
			position: relative;
			max-width: 400px;
		}
		.hp .hp-input {
			-moz-border-radius: 4px;
			-webkit-border-radius: 4px;
			border-radius: 4px;
			box-sizing: border-box;
			-moz-box-shadow: 0 1px 1px #fff;
			-webkit-box-shadow: 0 1px 1px #fff;
			box-shadow: 0 1px 1px #fff;
			margin-top: 6px;
			overflow: hidden;
			border: 1px solid #9CA3B3;
			float:left;
			background: #fff;
			position: relative;
			height: 48px;	
		}
		.hp .hp-input.hp-input-cc {
			-moz-border-radius: 4px 0 0 4px;
			-webkit-border-radius: 4px;
			border-radius: 4px 0 0 4px;
			border-right: 0 none;
			width: 50%;	
		}
		.hp .hp-input.hp-input-name {
			width: 50%;
			-moz-border-radius: 0 4px 4px 0;
			-webkit-border-radius: 0;
			border-radius: 0 4px 4px 0;
		}
		.hp .hp-input>input {
			margin: 0;
			padding: 0;
			position: relative;
			display: block;
			border: 0;
			background: #f3f3f3;
			min-height: 100%;
			font-size: 16px;
			font-family: "Segoe UI Light","Segoe UI","Selawik Light",Arial,sans-serif;
			text-indent: 14px;
		}
		.hp .hp-input.hp-input-cc>input, .hp .hp-input.hp-input-name>input {
			width: 100%;
		}
		.hp .hp-break {
			overflow: hidden;
			clear: both;
		}
		.hp .hp-input.hp-input-cvv {
			width: 50%;
		}
		.hp .hp-input.hp-input-cvv>input{
			width: 100%;
		}
		.hp .hp-col-right .hp-content-cc .hp-input-cvv-image {
			background-position: 0 -1019px;
			height: 21px;
			width: 31px;
			position: absolute;
			top: 13px;
			right: 14px;			
		}
		.hp .hp-submit {
			margin: 8px 0 0;
			-moz-border-radius: 4px;
			-webkit-border-radius: 4px;
			border-radius: 4px;
			text-shadow: 0 1px 1px #0062cc;
			background: #007aff;
			border: 1px solid #0062cc;
			color: #f3f3f3;
			display: block;
			padding: 12px 24px;
			font-size: 18px;
			cursor: pointer;
			width: 100%;
			text-transform: uppercase;
			text-align: center;
			outline: 0;
			position: relative;
			top: 0;			
		}
		.component-hp .hp .hp-col-right .pure-u-1 .hp-content{
			border-left: none;
		}
	</style>
</component-hp>