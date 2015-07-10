class HomeController < ApplicationController
  before_filter :set_cache_buster

  def index
  end

  # Dont cache the home page so that logging out and clicking the back button
  # will redirect to login page.
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
