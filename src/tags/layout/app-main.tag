<app-main class="grid__cell--offset-20 grid__cell--width-80">
  <article>
    <img src="./src/images/logo.jpg" class="maxx-logo" alt="">
    <h1>{ this.state.page.title }</h1>
    <p>{ this.state.page.body }</p>

    <home-page class="page-tag" page={this.state.page} ></home-page>

    <products-page class="page-tag" if={this.state.page.id == 'PRODUCTS'} page={this.state.page} ></products-page>

    <news-page class="page-tag" if={this.state.page.id == 'NEWS'} page={this.state.page} ></news-page>

    <faq-page class="page-tag" if={this.state.page.id == 'FAQ'} page={this.state.page} ></faq-page>

    <contact-page class="page-tag" if={this.state.page.id == 'CONTACT'} page={this.state.page} ></contact-page>
    <checkout-page class="page-tag" page={this.state.page} ></checkout-page>
<!--     <checkout-page if={this.state.page.id == 'CHECKOUT'} page={this.state.page} ></checkout-page> -->
  </article>

  <script>
    var actions = require('./actions.js');
    var sharedActions = require('../shared/actions.js');
    var riotGearActions = require('../riotgear/actions.js');
    var store = this.opts.store;

    store.subscribe(function(){
      this.state = store.getState();
      this.update();
    }.bind(this));
    
  </script>

  <style scoped>
    :scope {
      display: block;
      font-family: sans-serif;
      margin-right: 0;
      margin-bottom: 130px;
      margin-left: 50px;
      padding: 1em;
      text-align: center;
      color: #666;
      width:80%;
    }
    .maxx-logo{
      width: 60%;
      display: table;
      margin: 0 auto;
    }
    .page-tag{
      display: table;
      margin: 0 auto;
    }
    @media (min-width: 480px) {
      :scope {
        margin-right: 200px;
        margin-bottom: 0;
      }
    }

  </style>

</app-main>
