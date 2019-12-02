class ManufacturersController < ApplicationController
  
  def index
    @manufacturer = Manufacturer.all
  end
  
  def show
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
    @manufacturer.save
    redirect_to @manufacturer
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
  end
end
