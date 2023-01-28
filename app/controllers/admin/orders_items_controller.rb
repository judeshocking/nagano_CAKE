class Admin::OrdersItemsController < ApplicationController

  def update
    @order = Order.find(params[:id])
    @order_item = OrderItem.find(params[:order_item][:order_item_id])
    if @order_item.update(order_item_status_params)
      if @order.order_items.pluck(:maiking_status).include?("製作中")
         @order.order_status = 2
         @order.save
      else
        @order.order_details.pluck(:maiking_status).all?{|status|status == "製作完了"}
        @order.order_status = 3
        @order.save
      end
    flash[:success] = "制作ステータスを変更しました。"
      redirect_to admin_order_path(@order)
    else
      redirect_to admin_order_path(@order_item.order.id)
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
