class Admin::OrdersItemsController < ApplicationController

  def update
    @order_item = Orderitem.find(params[:id])
    @order = @order_item.order
    #byebug
    @order_items = @order.order_items
    @order_item.update(order_item_params)

    if @order_items.where(making_status: "製作中").count >= 1
      @order.status = "製作中"
      @order.save
    end

     if @order.order_items.count == @order_items.where(making_status: "製作完了").count
       @order.status = "発送準備中"
       @order.save
     end
    redirect_to admin_order_item_path(@order_item.order.id)
  end
  private

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end