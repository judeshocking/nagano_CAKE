class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @custome = Customer.find(current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
    if params[:order][:select] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def compleate
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
  end

  def index
    @orders = Order.where(customer_id:current_customer).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end


  private
  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name)
  end

  def custome_params
    params.require(:custome).permit(:postal_code)
  end

end
