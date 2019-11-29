class FiatManufacturersController < ApplicationController
  
    def index
      @manufacturer = FiatManufacturer.all
    end
    
    def show
      @manufacturer = FiatManufacturer.find(params[:id])
    end
  
    def new
    end
  
    def create
      @manufacturer = FiatManufacturer.new(params.require(:fiat_manufacturer).permit(:name))
      if @manufacturer.save
        redirect_to @manufacturer
      else
        render "new"
      end
    end
  
    def update
      @manufacturer = FiatManufacturer.find(params[:id])
    end
  
  end
  