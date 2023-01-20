class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @custome = Customer.find(current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
  end

  def compleate
  end

  def index
    @orders = Order.where(customer_id:current_customer).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end


  private
  def order_params
    params.require(:order).permit(:payment_method)
  end

  def custome_params
    params.require(:custome).permit(:postal_code)
  end

end
