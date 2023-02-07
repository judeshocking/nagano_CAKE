class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find_by(params[:id])
    @orders = Order.all
    @order_items = OrderItem.where(order_id: @order)
  end

  def update
     @order = Order.find(params[:id])
     @order_items = OrderItem.where(order_id: @order)
      if @order.update(order_params)
        if @order.status.include?("payment_confirmation")
           @order_items.update_all( making_status: "waiting_for_production")
        end
        redirect_to admin_order_path(@order)
      else
          render "show"
      end
  end


  def order_params
    params.require(:order).permit(:status)
  end
end

