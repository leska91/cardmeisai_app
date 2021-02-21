class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @orders = Order.order('created_at DESC').includes(:user)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end

  def edit
    redirect_to action: :index unless (current_user.id == @order.user_id)
  end

  def update
    if @order.update(order_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:date, :amount, :category_id, :memo).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  def set_item
    @order = Order.find(params[:id])
  end
end
