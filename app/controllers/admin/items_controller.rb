class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    @item = Itme.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      flash[:item_created_error] = "商品情報が正しく保存されていません"
      redirect_to new_admin_item_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_prams)
      redirect_to admin_item_path(@item)
    else
      flash[:item_created_error] = "商品情報が正しくに保存されていません"
      redirect_to edit_admin_item_path(@item)
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
  end

end
