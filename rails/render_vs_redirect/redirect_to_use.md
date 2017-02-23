@redirect_back
  `redirect_back(fallback_location: root_path)`
  You can use redirect_back to return the user to the page they just came from. This location is pulled from the HTTP_REFERER header which is not guaranteed to be set by the browser, so you must provide the fallback_location to use in this case.

@status_codes
  `redirect_to photos_path, status: 301`
  Rails uses HTTP status code 302, a temporary redirect, when you call redirect_to. If you'd like to use a different status code, perhaps 301, a permanent redirect, you can use the :status option.
