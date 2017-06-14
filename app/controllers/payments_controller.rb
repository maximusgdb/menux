class PaymentsController < ApplicationController
   before_action :set_order, :find_bar

  def new
    authorize @order
  end

  def create
    authorize @order
      customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_cents * 100, # or amount_pennies
    description:  "Payment for order #{@order.id}",
    currency:     :eur
  )

  @order.update(payment: charge.to_json, confirmed: true)
  flash[:notice] = "Payment done"
  redirect_to bar_order_path(@bar, @order)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_bar_order_payment_path(@bar, @order)
  end

private

  def set_order
    @order = Order.where(confirmed: false).find(params[:order_id])
  end

   def find_bar
    @bar = Bar.find(params[:bar_id])
  end
end

