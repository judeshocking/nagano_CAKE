class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
  end

  def compleate
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method)
  end

end
