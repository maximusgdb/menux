class BarsController < ApplicationController
  before_action :find_bar, only: [ :show, :edit, :update, :destroy ]

  def index
    @bars = policy_scope(Bar)
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    authorize @bar
    if @bar.save
      redirect_to bar_path(@bar)
    else
      render :new
    end
  end

  def show
    #find
  end

  def edit
    #find
  end

  def update
    #find
    if @bar.update(bar_params)
      authorize @bar
      flash[:notice] = "Updated"
      redirect_to bar_path(@bar)
    else
      render :new
    end
  end

  def destroy
    #find
    @bar.destroy
    authorize @bar
    redirect_to bars_path
  end

  private

  def find_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:name, :description, :address, :opening_hours, :picture, :picture_cache)
  end

end
