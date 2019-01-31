class BandsController < ApplicationController

  def new
    @band = Band.new
  end

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(band_params)
    if @band.save!
      redirect_to bands_url 
    else
      @band.errors.full_messages
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
  end
  
  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to bands_url
    else
      @band.errors.full_messages
    end

  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url    
  end


  private
  def band_params
    params.require(:band).permit(:name)
  end
end