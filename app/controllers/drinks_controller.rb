class DrinksController < ApplicationController
  before_action :find_bar

  def index
    if @current_order.nil?
      @order = current_user.orders.create!(bar: @bar)

    else
      @order = @current_order
    end
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    authorize @drink
    @drink.bar = @bar
    if @drink.save
      redirect_to bar_drink_path(@bar, @drink)
    else
      render :new
    end
  end

  def show
    @drink = Drink.find(params[:id])
    authorize @drink
  end

  def edit
    @drink = Drink.find(params[:id])

  end

  def update
    @drink = Drink.find(params[:id])
    authorize @drink
    if @drink.update(drink_params)
      flash[:notice] = "Updated"
      redirect_to bar_drink_path(@bar, @drink)
    else
      render :new
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    authorize @drink
    redirect_to bar_drink_path(@bar)
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description, :price, :size, :favorite, :picture)
  end

  def find_bar
    @bar = Bar.find(params[:bar_id])
  end
end
