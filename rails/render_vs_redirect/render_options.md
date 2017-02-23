*Options for Render*
  :content_type
  :layout
  :location
  :status
  :formats

  @Option-:layouts
    To find the current layout, Rails first looks for a file in `app/views/layouts` with the same base name as the controller.
      - For example, rendering actions from the PhotosController class will use `app/views/layouts/photos.html.erb`. If there is no such controller-specific layout, Rails will use `app/views/layouts/application.html.erb`.

      ```
        class ProductsController < ApplicationController
          layout "inventory"
          #...
        end
      ```

      - You can use a symbol to defer the choice of layout until a request is processed. This way, if the current user is a special user, they'll get a special layout when viewing a product:
      ```
        class ProductsController < ApplicationController
          layout :products_layout

          def show
            @product = Product.find(params[:id])
          end

          private
            def products_layout
              @current_user.special? ? "special" : "products"
            end
        end
      ```

  @Option-:location
    `render xml: photo, location: photo_url(photo)`
    You can use the :location option to set the HTTP Location header:

  @Option-:status
    `render status: 500`
    `render status: :forbidden`
    Rails will automatically generate a response with the correct HTTP status code (in most cases, this is 200 OK). You can use the :status option to change this.

  @Option-:formats
    `render formats: :xml`
    `render formats: [:json, :xml]`
    Rails uses the format specified in the request (or :html by default). You can change this passing the :formats option with a symbol or an array.
