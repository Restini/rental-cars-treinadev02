class ManufacturersController < ApplicationController
  
  def index
    @manufactures = Manufacturer.all
  end
  
  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
    redirect_to @manufacturer
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
  end
end
