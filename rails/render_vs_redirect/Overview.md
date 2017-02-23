# Render
Render creates a full response that is sent back to the browser.
Render tells Rails which view (or other asset) to use in constructing a response.
Render doesn't run any code in the target action.
  `render action: :index` -- loads the index.html.erb template in the view file that corresponds to the controller

  *Instance or Local variables?*
    http://theartandscienceofruby.com/2015/07/28/why-shouldnt-i-pass-instance-variables-to-views/
      With render, Rails takes those instance variables from your controller and shovels them into another object, a View. This is a bit weird from a programming point of view – you’re taking private state from one object and putting it into another – which is a reason to avoid doing it.


`ActionController::Base#render`

# Redirect
Redirect tells the browser to send a new request for a different URL.
Call redirect_to to send an HTTP redirect status code to the browser
  `redirect_to action: :index` -- makes a fresh request for the index page, running the index method in the present controller



  This could be a location within your application by calling something like;
    `redirect_to widgets_url`

  Or it can be to a completely different website;
    `redirect_to "http://tosbourn.com"`

# Head
Call head to create a response consisting solely of HTTP headers to send back to the browser


# Examples

*render vs redirect*
  `def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      x_________x action: "index"
    end
  end`

  @Render: If we use render, there will likely be a problem if the @book variable is nil. Remember, a render :action doesn't run any code in the target action, so nothing will set up the @books variable that the index view will probably require.
  @Redirect_to: With redirect_to, the browser will make a fresh request for the index page, the code in the index method will run, and all will be well.
