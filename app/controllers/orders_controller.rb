class OrdersController < ApplicationController

   before_action :find_bar

  def show
    @order = Order.find(params[:id])
  end

  private

  def find_bar
    @bar = Bar.find(params[:bar_id])
  end

  def orders_params
    params.require(:order).permit(:table_number, :delivered, :confirmed)
  end

end
