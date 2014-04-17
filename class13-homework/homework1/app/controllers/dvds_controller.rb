class DvdsController < ApplicationController



  def create
    @dvd = Dvd.create dvd_params
    if @dvd.save
      flash[:notice] = "You got that dvd in your index!"
      redirect_to root_path
    elsif 
      flash[:error] = "Your DVD did not save, suckkaa"
      render :new
    end
  end

  def new
    @dvd = Dvd.new
  end

  def edit
    @dvd = Dvd.find params[:id]
  end

  def update
    @dvd = Dvd.find params[:id]
    if @dvd.update_attributes dvd_params
      flash[:notice] = "You got that dvd in your index! "
    redirect_to root_path
    elsif flash[:error] = "Your DVD did not save, suckkaa"
    render :edit
    end
  end

  def destroy
    @dvd = Dvd.find params[:id]
    @dvd.delete
    redirect_to root_path
  end

  def show
  end

  private
  def dvd_params
    params.require(:dvd).permit(:name, :rating, :director, :release_date, :genre, :length, :description, :good_movie)
  end
end
