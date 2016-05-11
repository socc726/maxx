<app-main>
  <article class="pure-u-5-5">
    <h1 class="page-title">{ this.state.page.title }</h1>
    <p class="page-body">{ this.state.page.body }</p>

    <home-page class="page-tag" if={this.state.page.id == 'HOME'} ></home-page>

    <products-page class="page-tag" if={this.state.page.id == 'PRODUCTS'} page={this.state.page} ></products-page>

    <news-page class="page-tag" if={this.state.page.id == 'NEWS'} page={this.state.page} ></news-page>

    <faq-page class="page-tag" if={this.state.page.id == 'FAQ'} page={this.state.page} ></faq-page>

    <contact-page class="page-tag" if={this.state.page.id == 'CONTACT'} page={this.state.page} ></contact-page>
    <!-- <checkout-page class="page-tag" page={this.state.page} ></checkout-page> -->
    <checkout-page if={this.state.page.id == 'CHECKOUT'} page={this.state.page} ></checkout-page>


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
/*      display: block;
      font-family: sans-serif;
      margin-right: 0;
      margin-bottom: 130px;
      margin-left: 50px;*/
      padding: 1em;
      text-align: center;
      color: #666;
      /*width:80%;*/
    }
    .page-title{
      text-align: left;
      margin-top:0;
    }
    .page-body{
      text-align: left;
    }
    .page-tag{
      display: table;
      margin: 0 auto;
    }

  </style>

</app-main>
