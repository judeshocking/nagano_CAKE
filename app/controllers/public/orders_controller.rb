class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @custome = Customer.find(current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
    @billing_amount = calculate(current_customer)
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
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_item = OrderItem.new
        order_item.item_id = cart.item_id
        order_item.order_id = @order.id
        order_item.amount = cart.amount
        order_item.save
      end
      cart_items.destroy_all
      redirect_to orders_compleate_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end


  def index
    @orders = Order.where(customer_id:[current_customer.id])
  end

  def show
    @order = Order.find(params[:id])
    @billing_amount = calculate(current_customer)
  end


  private
  def order_params
    params.require(:order).permit(:customer_id,:payment_method,:postal_code,:address,:name,:billing_amount)
  end

  def custome_params
    params.require(:custome).permit(:postal_code)
  end

  def calculate(user)
     billing_amount = 0
     user.cart_items.each do |cart_item|
       billing_amount += cart_item.amount * cart_item.item.price
     end
     return (billing_amount * 1.1).floor
   end

end
