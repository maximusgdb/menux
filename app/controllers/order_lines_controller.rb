class OrderLinesController < ApplicationController

  before_action :find_bar

  def create

  end

  def update
  end

  private

  def find_bar
    @bar = Bar.find(params[:bar_id])
  end
end
