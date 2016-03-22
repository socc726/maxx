<app-main class="grid__cell--offset-20 grid__cell--width-80">

  <home-page page={this.state.page} ></home-page>

  <script>
    var actions = require('./actions.js');
    var sharedActions = require('../shared/actions.js');
    var riotGearActions = require('../riotgear/actions.js');
    var store = this.opts.store;

    store.subscribe(function(){
      this.state = store.getState();
      this.update();
    }.bind(this));

    this.on('mount', function(){
      store.dispatch(actions.createHomePage());
    });
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
    ul {
      padding: 10px;
      list-style: none;
    }
    li {
      display: inline-block;
      margin: 5px;
    }
    a {
      display: block;
      background: #f7f7f7;
      text-decoration: none;
      width: 150px;
      height: 150px;
      line-height: 150px;
      color: inherit;
    }
    a:hover {
      background: #eee;
      color: #000;
    }
    .maxx-logo{
      width: 100%;
    }
    @media (min-width: 480px) {
      :scope {
        margin-right: 200px;
        margin-bottom: 0;
      }
    }

  </style>

</app-main>
