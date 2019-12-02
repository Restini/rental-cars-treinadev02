class SubsidiariesController < ApplicationController
  
  def index
    @subsidiary = Subsidiary.all
  end

  def show
  end
    
  def new
    @subsidiary = Subsidiary.new
  end

  def create
    puts params
    @subsidiary = Subsidiary.new(params.require(:subsidiary).permit(:name,:cnpj,:address))
    @subsidiary.save
    redirect_to @subsidiary
  end
  
  def update
    @subsidiary = Subsidiary.find(params[:id])
  end
end
