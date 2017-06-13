class OrderLinesController < ApplicationController

  before_action :find_bar, :find_order

  def create
    drink = Drink.find(params[:drink_id])
    authorize drink
    existing_line = @order.order_lines.find_by(drink: drink)
    if existing_line
      if params[:remove]
        if existing_line.quantity - 1 == 0
          existing_line.destroy
        else
          existing_line.quantity -= 1
          if existing_line.save
            respond_to do |format|
              format.html { redirect_to bar_order_path(@bar, @order) }
              format.js  # <-- will render `app/views/reviews/create.js.erb`
            end
          end
        end
      else
        existing_line.quantity += 1
        if existing_line.save
          respond_to do |format|
            format.html { redirect_to bar_order_path(@bar, @order) }
            format.js  # <-- will render `app/views/reviews/create.js.erb`
          end
        end
      end
    else
      @order.order_lines.create(drink: drink)
    end

  end


  private

  def find_bar
    @bar = Bar.find(params[:bar_id])
  end

  def find_order
    @bar = Bar.find(params[:bar_id])
    @order = current_user.current_order_per_bar(@bar)
  end
end
