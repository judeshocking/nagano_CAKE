class Admin::OrdersItemsController < ApplicationController

  def update

    @order = Order.find(params[:id])
    @order_item = Orderitem.find(params[:order_item][:order_item_id])
    if @order_item.update(order_item_params)
      if @order.order_items.pluck(:making_status).include?("製作中")
         @order.status = 2
         @order.save
      else
         @order.order_items.pluck(:making_status).all?{|status|status == "製作完了"}
         @order.status = 3
         @order.save
      end
      flash[:success] = "制作ステータスを変更しました。"
      redirect_to admin_order_item_path(@order)
    else
      redirect_back(fallback_location: root_path)
    end
  end


  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end