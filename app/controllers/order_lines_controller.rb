class OrderLinesController < ApplicationController

  before_action :find_bar, :find_order

  def create
    drink = Drink.find(params[:drink_id])
    existing_line = @order.order_lines.find_by(drink: drink)
    if existing_line
      if params[:remove]
        if existing_line.quantity - 1 == 0
          existing_line.destroy
        else
          existing_line.quantity -= 1
          existing_line.save
        end
      else
        existing_line.quantity += 1
        existing_line.save
      end
    else
      @order.order_lines.create(drink: drink)
    end
    if params[:order]
      redirect_to bar_order_path(@bar, @order)
    else
      redirect_to bar_drinks_path(@bar)
    end
  end


  private

  def find_bar
    @bar = Bar.find(params[:bar_id])
  end

  def find_order
    @order = current_user.current_order
  end
end
