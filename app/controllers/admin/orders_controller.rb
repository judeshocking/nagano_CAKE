class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_items = @order.order_items

    if @order.status == "入金確認"
       @order_items.each do |order_item|
         order_item.maiking_status = "製作待ち"
         order_item.save
       end
    end
    redirect_to admin_order_path
  end


  def order_params
    params.require(:order).permit(:status)
  end
end
