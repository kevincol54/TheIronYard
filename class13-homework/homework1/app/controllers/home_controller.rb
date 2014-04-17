class HomeController < ApplicationController

  def index
    @dvd = Dvd.all
  end
  
end
