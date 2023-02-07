class Admin::OrderItemsController < ApplicationController

  def update

    @order = Order.find_by(params[:id])
    @order_item = OrderItem.find_by(params[:order_item][:order_item_id])
    if @order_item.update(order_item_params)
      if @order.order_items.pluck(:making_status).include?("production")
         @order.status = 2
         @order.save
      else
         @order.order_items.pluck(:making_status).all?{|status|status == "production_completed"}
         @order.status = 3
         @order.save
      end
      flash[:success] = "制作ステータスを変更しました。"
      redirect_to admin_order_path
    else
      redirect_to admin_order_path
    end
  end


  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
