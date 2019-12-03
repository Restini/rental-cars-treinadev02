class HomeController < ApplicationController

    def index
      @manufacturers = Manufacturer.all
    end
=begin
    def show
      id = params[:id]
      @manufacturer = Manufacturer.find(params[:id])
    end
    
    def new
      @manufacturer = Manufacturer.all
    end
    
    def create
      @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
      @manufacturer.save
      redirect_to @manufacturer
    end
  
    def update
      @manufacturer = Manufacturer.find(params[:id])
    end
=end
end
