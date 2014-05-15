class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @discussion = Discussion.all
  end
end
