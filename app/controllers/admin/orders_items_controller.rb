class Admin::OrdersItemsController < ApplicationController

  def update
    @order = Order.find(params[:id])
    @order_item = OrderItem.find(params[:id])
    @order_items = @order.order_items.all
    is_updated = true
    if @order_item.update(order_item_params)
      @order.update(status: 2) if @order_item.making_status == "製作中"
        @order_items.each do |order_item|
          if order_detail.making_status != "制作完了"
            is_updated = false
          end
        end
    end
    @order.update(status: 3) if is_updated
    flash[:success] = "制作ステータスを変更しました。"
    redirect_to admin_order_path(@order_item.order.id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end