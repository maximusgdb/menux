class OrdersController < ApplicationController

   before_action :find_bar

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    @order.amount = @order.total_order
    @order.table_number = orders_params[:table_number] if params[:order] && params[:order][:table_number]
    if @order.save
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
    params.require(:order).permit(:table_number, :delivered, :confirmed, :in_charge, :amount_cents, :payment)
  end

end
