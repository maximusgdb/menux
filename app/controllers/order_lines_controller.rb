class OrderLinesController < ApplicationController

  before_action :find_bar, :find_order

  def create

  end

  def update
  end

  private

  def find_bar
    @bar = Bar.find(params[:bar_id])
  end

  def find_order
    @order = current_user.current_order
  end
end
