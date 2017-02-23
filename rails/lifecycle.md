http://theartandscienceofruby.com/2015/08/25/how-does-rails-work/

What happens when you visit http://localhost:3000 in the browser?
  1. The browser makes a request for the URL http://localhost:3000.
  2. The request hits the Rails router in config/routes.rb. The router recognizes the URL and sends the request to the controller.
  3. The controller receives the request and processes it.
  4. The controller passes the request to the view.
  5. The view renders the page as HTML.
  6. The controller sends the HTML back to the browser for you to see.


The lifecycle is built as a series of layers, each one has its own distinct role. In particular, in your application itself;
  1) Packaging and mediation belongs in the controller;
  2) Your application-specific logic belongs in the models; and
  3) Your output belongs in the view.

Try to avoid mixing them – don’t have authorization in your models, don’t make decisions in your views, and your Rails app will be much simpler and easier to follow.
