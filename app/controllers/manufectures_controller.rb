class ManufecturesController < ApplicationController
  
  def index
    @manufectures = Manufecture.all
  end
  
  def show
    @manufecture = Manufecture.find(params[:id])
  end

  def new
    @manufecture = Manufecture.new
  end

  def create
    @manufecture = Manufecture.new(params.require(:manufecture).permit(:name))
    if @manufecture.save
      redirect_to @manufecture
    else
      render "new"
    end
  end

  def update
    @manufecture = Manufecture.find(params[:id])
  end

end
