class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path
    else
      flash[:notice] = "商品情報が正しく保存されていません"
      redirect_to new_admin_item_path
    end
  end
end
