class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    authorize! :read, Location
    @location = Location.all
  end
end
