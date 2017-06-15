class Waiter::OrdersController < ApplicationController

   before_action :find_bar

  def index
    @orders = policy_scope(Order)

  end

  def show
  @order = Order.where(confirmed: true).find(params[:id])
    authorize @order


  end

def update
  @order = Order.find(params[:id])
  authorize @order

  if params[:in_charge]
    @order.in_charge = !@order.in_charge
    @order.save
    redirect_to bar_waiter_order_path(@bar, @order)
  end

  if params[:delivered] == "true"
    @order.delivered = true
    @order.save
    redirect_to bar_waiter_orders_path(@bar, @order)
  end
end

  private

  def find_bar
    @bar = Bar.find(params[:bar_id])
  end


  def orders_params
    params.require(:order).permit(:table_number, :delivered, :confirmed, :in_charge)
  end

end
