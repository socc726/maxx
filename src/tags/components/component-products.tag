<component-products class="container container--medium">  
  <div class="pure-g">
    <div class="pure-u-1-3" each={product in this.opts.products}>
    
      <div class="image-wrapper overlay-fade-in">
        
        <img src="{product.images[0]}/resize/250" class="pure-img"/>
        
        <div class="image-overlay-content">
          <h2>{product.name}</h2>
          <p class="price">${product.retailPrice}</p>
          <button class="button" onclick={addProduct}>Get it</button>
        </div>
      
      </div>
    
    </div>
      
  </div>    
  <script>
    function hasClass(el, className) {
      if (el.classList)
        return el.classList.contains(className)
      else
        return !!el.className.match(new RegExp('(\\s|^)' + className + '(\\s|$)'))
    }
    animateCart(exists){
      var shoppingCart = document.getElementById('ShoppingCart');

      var cartItem = document.getElementsByClassName('cart-product')[0];

      var height = 0;

      console.log(height + " here is height");
      console.log(shoppingCart.offsetHeight + " cart height");

      console.log(height + " combined");
      if(hasClass(shoppingCart, 'invisible') || hasClass(shoppingCart, 'fadeOutUpBig')){
        height = shoppingCart.offsetHeight + 50;
      }

      if(!exists){
        if(cartItem == null){
          height += 187;
        }else{
          height += cartItem.offsetHeight + 9;
        }
      }
      
      this.opts.movedown(height);
    }

    addProduct(e){
        var product = e.item.product;
        var doesExist = this.opts.exists(e.item.product.id);
        this.animateCart(doesExist);
        this.opts.add(product);console.log(this.opts);
    }
  </script>
  <style scoped>
    img.pure-img{
        margin: 0 auto;
    }
    .image-wrapper {
        width: 100%;
        height: 100%;
        border: 1px solid rgba(0, 0, 0, 0.04);
        overflow: hidden;
        position: relative;
        text-align: center;
        border-radius: 4px;
        cursor: pointer;
    }
    .image-overlay-content {
        width: 100%;
        height: 100%;
        position: absolute;
        overflow: hidden;
        top: 0;
        left: 0;
    }
    .overlay-fade-in p {
        letter-spacing: 0.15em;
        color: #f4f4f4;
        font-size: 28px;
        opacity: 0;
        transition: all 0.2s linear;
    }
    .overlay-fade-in img {
        transition: all 0.2s linear;
    }
    .overlay-fade-in .image-overlay-content {
        opacity: 0;
        background-color: rgba(0, 0, 0, 0.4);
        transition: all 0.4s ease-in-out;
    }
    .overlay-fade-in h2 {
        color: #f2f2f2;
        font-size: 1.2rem;
        margin-top: 10%;
        opacity: 0;
        transition: all 0.2s ease-in-out;
        background: rgba(0, 0, 0, 0.7);
    }
    .overlay-fade-in .button {
        display: inline-block;
        text-decoration: none;
        padding: 7px 14px;
        background: #FFF;
        color: #222;
        text-transform: uppercase;
        box-shadow: 0 0 1px #000;
        position: relative;
        border: 1px solid #999;
        opacity: 0;
        transition: all 0.2s ease-in-out;
    }
    .overlay-fade-in .button:hover {
        box-shadow: 0 0 5px #000;
    }
    .overlay-fade-in:hover img {
        transform: scale(1.2);
    }
    .overlay-fade-in:hover .image-overlay-content {
        opacity: 1;
    }
    .overlay-fade-in:hover h2,
    .overlay-fade-in p,
    .overlay-fade-in .button {
        opacity: 1;
    }
    .overlay-fade-in:hover p {
        transition-delay: 0.1s;
    }
    .overlay-fade-in:hover .button {
        transition-delay: 0.2s;
    }
  </style>
</component-products>