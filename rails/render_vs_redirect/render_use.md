*Using Render*
  @Template:
    `render template: "products/show"`

  @File:
    `render file: "/u/apps/warehouse_app/current/app/views/products/show"`

  @Other-ways-to-write-these
    render :edit
    render action: :edit
    render "edit"
    render "edit.html.erb"
    render action: "edit"
    render action: "edit.html.erb"
    render "books/edit"
    render "books/edit.html.erb"
    render template: "books/edit"
    render template: "books/edit.html.erb"
    render "/path/to/rails/app/views/books/edit"
    render "/path/to/rails/app/views/books/edit.html.erb"
    render file: "/path/to/rails/app/views/books/edit"
    render file: "/path/to/rails/app/views/books/edit.html.erb"

  @Debugging
    `render_to_string`
    If you want to see the exact results of a call to render without needing to inspect it in a browser, you can call render_to_string. This method takes exactly the same options as render, but it returns a string instead of sending a response back to the browser.

  @Inline:
    `render inline: "<% products.each do |p| %><p><%= p.name %></p><% end %>"`
    There is seldom any good reason to use this option. Mixing ERB into your controllers defeats the MVC orientation of Rails and will make it harder for other developers to follow the logic of your project. Use a separate erb view instead.

  @Plain:
    `render plain: "OK"`
    Rendering pure text is most useful when you're responding to Ajax or web service requests that are expecting something other than proper HTML.

  @JSON:
    `render json: @product`
    JSON is a JavaScript data format used by many Ajax libraries. Rails has built-in support for converting objects to JSON and rendering that JSON back to the browser
    You don't need to call to_json on the object that you want to render. If you use the :json option, render will automatically call to_json for you.

  @XML:
    `render xml: @product`

  @Vanilla-JS:
    `render js: "alert('Hello Rails');"`
