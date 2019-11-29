class FiatManufecturesController < ApplicationController
  
    def index
      @manufecture = FiatManufecture.all
    end
    
    def show
      @manufecture = FiatManufecture.find(params[:id])
    end
  
    def new
    end
  
    def create
      @manufecture = FiatManufecture.new(params.require(:fiat_manufecture).permit(:name))
      if @manufecture.save
        redirect_to @manufecture
      else
        render "new"
      end
    end
  
    def update
      @manufecture = FiatManufecture.find(params[:id])
    end
  
  end
  