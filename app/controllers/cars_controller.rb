class CarsController < ApplicationController
        
    def index
      @cars = Car.all
    end
  
    def show
      @car = Car.find(params[:id])
    end
      
    def new
      @car = Car.new
    end
  
    def edit
      @car = Car.find(params[:id])
    end
    
    def create
      @car = Car.new(car_params)
      #set_collections
      
      if @car.save
        redirect_to @car
      else
        flash.now[:alert] = 'Favor preencher todos os campos'  
        render :new 
      end
    end
  
    def destroy
      car = Car.find(params[:id]) 
      car.destroy 
      redirect_to root_path
    end
  
    def update
      @car = Car.find(params[:id])
      if @car.update(car_params)
        flash[:notice] = 'Carro cadastrado com sucesso'
        redirect_to @car
      else
        render :edit
      end
    end
  
    def set_collections
      @car_models = Car_model.all
      @subsidiaries = Subsidiarie.all
    end

    private
  
    def car_params
      params.require(:car).permit(:license_plate, :color, :mileage)
    end
  end