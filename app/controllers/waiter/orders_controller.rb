class Waiter::OrdersController < ApplicationController

   before_action :find_bar

  def index
    @orders = policy_scope(Order)

  end

  def show
    @order = Order.find(params[:id])
    authorize @order


  end

def update
  @order = Order.find(params[:id])
  authorize @order
  @order.in_charge = true if params[:in_charge] == "true"
  @order.delivered = true if params[:delivered] == "true"

  @order.save
  redirect_to bar_waiter_orders_path(@bar, @order)
end

  private

  def find_bar
    @bar = Bar.find(params[:bar_id])
  end


  def orders_params
    params.require(:order).permit(:table_number, :delivered, :confirmed, :in_charge)
  end

end
