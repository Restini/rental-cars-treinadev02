class ManufacturersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create]
  #before_action :authorize_admin 
  #before_action :set_manufacturer 

  def index
    @manufacturers = Manufacturer.all
  end
  
  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    
    if @manufacturer.save
      redirect_to @manufacturer
    else
      flash.now[:alert] = 'Favor preencher todos os campos'  
      render :new 
    end
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update(manufacturer_params)
      flash[:notice] = 'Fabricante atualizada com sucesso'
      redirect_to @manufacturer
    else
      render :edit
    end
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end  

  #def authorize_admin
  #  unless current_user.admin?
  #  flash[:notice] = 'Você não tem autorização'
  #  redirect_to root_path 
  #end
end