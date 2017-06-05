class BarsController < ApplicationController
  before_action :find_bar, only: [ :show, :edit, :update, :destroy ]

  def index
    @bars = Bar.all
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    if @bar.save
      redirect_to bar_path(@bar)
    else
      render :new
    end
  end

  def show
    #find
  end

  def edit
    #find
  end

  def update
    #find
    if @bar.update(bar_params)
      flash[:notice] = "Updated"
      redirect_to bar_path(@bar)
    else
      render :new
    end
  end

  def destroy
    #find
    @bar.destroy
    redirect_to bars_path
  end

  private

  def find_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:name, :description, :address, :opening_hours, :picture)
  end

end
