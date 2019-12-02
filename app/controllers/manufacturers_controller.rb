class ManufacturersController < ApplicationController
  
  def index
    @manufacturer = Manufacturer.all
  end
  
  def show
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
    
    if @manufacturer.save
      redirect_to @manufacturer
    else
      flash[:alert] = 'Fabricante atualizado com sucesso'  
      render :new #usando a view do new 
    end
  end

  def update
      @manufacturer = Manufacturer.find(params[:id])
    if  @manufacturer.update.(manufacturer_params)
      flash[:notice] = 'Fabricante atualizado com sucesso'
      redirect_to @manufacturer
    else
      render :edit
    end
  end
end
