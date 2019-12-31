class RentalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create]
  before_action :authorize_admin 
  before_action :set_manufacturer 

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
		@rental.update(status: :in_progress)
		
		@car = Car.find(params[:rental][:car_id])
		@car.unavailable!
		@rental.create_car_rental(car: @car, price: @car.price)
		flash[:notice] = 'Locação iniciada com sucesso'
		redirect_to @rental
		end
  end

  def create
    @rental = Rental.new(params.require(:rental).permit(:start_date, :end_date,
                                                        :client_id,
                                                        :car_category_id))
		if @rental.save
		  redirect_to @rental, notice: 'Locação agendada com sucesso'
		else
      @clients = Client.all
      @car_categories = CarCategory.all
      render :new
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