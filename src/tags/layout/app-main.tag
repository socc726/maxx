<app-main class="grid__cell--offset-20 grid__cell--width-80">

  <article>
    <h1>{ title }</h1>
    <p>{ body }</p>
    <ul if={ isFirst }>
      <li each={ data }><a href="/first/{ id }">{ title }</a></li>
    </ul>

    <todo-app></todo-app>
    
  </article>

  <script>
    var self = this
    self.title = 'Now loading...'
    self.body = ''
    self.data = [
      { id: 'apple', title: 'Apple', body: "The world biggest fruit company." },
      { id: 'orange', title: 'Orange', body: "I don't have the word for it..." }
    ]

    var r = riot.route.create();
    r('/', home);
    r('charger', charger);
    r('news', news);
    r('faq', faq);
    r('contact', contact);
    r(home);

    function home() {
      self.update({
        title:  "Home of the great app",
        body:  "Timeline or dashboard as you like!",
        isFirst: false
      })
    }
    function charger() {
      self.update({
        title: "First feature of your app",
        body: "It could be a list of something for example.",
        isFirst: true
      })
    }
    function news() {
    }
    function faq() {
      self.update({
        title: "Second feature of your app",
        body: "It could be a config page for example.",
        isFirst: false
      })
    }
    function contact() {
      self.update({
        title: "Second feature of your app",
        body: "It could be a config page for example.",
        isFirst: false
      })
    }
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
    @media (min-width: 480px) {
      :scope {
        margin-right: 200px;
        margin-bottom: 0;
      }
    }
  </style>

</app-main>
