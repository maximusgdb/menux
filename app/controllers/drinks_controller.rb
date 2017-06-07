class DrinksController < ApplicationController
  before_action :find_bar

  def index

    # checks if the order is already in the cookies
    # if cookies[:order]
    #   # if in cookies -> find it
    #   @order = Order.find(cookies[:order][:id])
    # else
    #   # if not in cookies then create one and save it in cookies

    #   # @order = Order.create(bar: @bar)

    #   cookies[:order] = { id: @order.id }
    # end
    if current_user.current_order.nil?
      @order = current_user.orders.create!(bar_id: @bar)
      puts "hello"
    else
      puts "already order"
      @order = current_user.current_order
    end
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    @drink.bar = @bar
    if @drink.save
      redirect_to bar_drink_path(@bar, @drink)
    else
      render :new
    end
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])
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
