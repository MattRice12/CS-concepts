## Request/response cycle
What happens when you visit http://localhost:3000 in the browser?
  1. The browser makes a request for the URL http://localhost:3000.
  2. The request hits the Rails router in config/routes.rb. The router recognizes the URL and sends the request to the controller.
  3. The controller receives the request and processes it.
  4. The controller passes the request to the view.
  5. The view renders the page as HTML.
  6. The controller sends the HTML back to the browser for you to see.
