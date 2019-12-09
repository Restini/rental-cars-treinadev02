class RentalsController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :edit, :create]
  #before_action :authorize_admin 
  #before_action :set_manufacturer 

  def index
    @rentals = Rental.all
  end
  
  def show
    @rentals = Rental.all.find(params[:id])
  end

  def new
    @rentals = Rental.all.new
    @client = Client.all #Populando o Select 
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