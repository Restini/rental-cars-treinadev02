class CarModelsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :create]  

    def index
    end
  
    def new
      @car_model = CarModel.new
      set_collections
    end
  
    def create
      @car_model = CarModel.new(car_model_params)
      
      if @car_model.save
        flash[:notice] = 'Modelo registrado com sucesso'
        redirect_to @car_model
      else
        @manufacturers = Manufacturer.all
        @categories = CarCategory.all
        flash.now[:alert] = 'Favor preencher todos os campos'  
        render :new
      end
    end
  
    def show
      @car_model = CarModel.find(params[:id])
    end
  
    private
  
    def car_model_params
      params.require(:car_model).permit(:name, :year, :motorization,
                                        :fuel_type, :car_category_id,
                                        :manufacturer_id)
    end
  
    def set_collections
      @manufacturers = Manufacturer.all
      @categories = CarCategory.all
    end
  
  end