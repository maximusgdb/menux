class OrdersController < ApplicationController

   before_action :find_bar

  def index
    @orders = policy_scope(Order).where(bar_id: params[:bar_id])
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    @order.amount = @order.total_order
    if @order.update(orders_params)
    redirect_to new_bar_order_payment_path(@bar, @order)
    else
      render :show
    end
  end

  private

  def find_bar
    @bar = Bar.find(params[:bar_id])
  end

  def orders_params
    params.require(:order).permit(:table_number, :delivered, :confirmed)
  end

end
