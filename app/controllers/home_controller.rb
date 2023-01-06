
class HomeController < ApplicationController
  def index
    @gallery = Gallery.all.first
  end
end
