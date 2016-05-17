class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @ad = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new

    @advertisement.title = params[:advertisement][:title]
    @advertisement.body = params[:advertisement][:body]
    @advertisement.price = params[:advertisement][:price]

    if @advertisement.save
      flash[:notice] = "Advertisement successfully saved."
      redirect_to @advertisement
    else
      flash.now[:alert] = "An error occurred while saving the ad. Please try again."
      render :new
    end
  end
end
