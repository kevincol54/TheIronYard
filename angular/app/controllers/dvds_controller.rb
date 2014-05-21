class DvdsController < ApplicationController
  def index
    @dvds = Dvd.all

    respond_to do |format|
      format.json { render json: @dvds.as_json}
    end
  end

  def new
  end

  def create
    @dvd = Dvd.create dvd_params

    respond_to do |format|
      format.json {render json: @dvd.as_json}
    end
  end

  def show
  end

  def edit
  end

  def update
    @dvd = Dvd.find params[:id]
    @dvd.update_attributes dvd_params

    respond_to do |format|
      format.json {render json: @dvd.as_json}
  end

  def destroy
  end
  private
    def dvd_params
      params.require(:dvd).permit(:title, :content)
    end
end
