class RentalsController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :edit, :create]
  #before_action :authorize_admin 
  #before_action :set_manufacturer 

  def index
    @rentals = Rental.all
  end
  
  def show
    @rentals = Rental.find(params[:id])
    @cars = Car.join(car_model).where(car_models: {car_category: @rental.category})
  end

  def new
    @rentals = Rental.new
    @client = Client.all #Populando o Select
    @car_categories = CarCategory.all 
  end

  def start
    @rental = Rental.find(params[:id])
    @rental.in_progress!
    flash.now[:alert] = 'Locação iniciada com sucesso'
    redirect_to @rental
  end

  def edit
    @rentals = Rental.all.find(params[:id])
  end

  def create
    @rentals = Rental.all.new(rental_params)
    
    if @rental.save
      redirect_to @rentals
    else
      flash.now[:alert] = 'Favor preencher todos os campos'  
      redirect_to 
    end
  end

  def update
    @rentals = Rental.all.find(params[:id])
    if @rentals.update(manufacturer_params)
      flash[:notice] = 'Fabricante atualizada com sucesso'
      redirect_to @rentals
    else
      render :edit
    end
  end

  def manufacturer_params
    params.require(:rental).permit(:name)
  end 

  def search
    @rentals = Rental.where(conservation_code: params[:q])

    render :index
  end
  
end