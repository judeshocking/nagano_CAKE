class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "新しい配送先の登録が完了しました"
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = current_customer.addresses
      flash[:notice] = "新しい配送先の内容に不備があります"
      render :index
    end
  end


  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:success] = "配送先の変更内容を保存しました。"
      redirect_to addresses_path
    else
      flash[:success] = "配送先の変更内容に不備があります。"
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    @address.destroy
    flash[:success] = "配送先の削除が完了しました。"
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end
end
