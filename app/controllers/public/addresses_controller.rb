class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.address
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "新しい配送先の登録が完了しました"
       redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = @customer.address
      flash[:notice] = "新しい配送先の内容に不備があります"
      render:index
    end
  end


  def edit
    @address = Address.find(params[:id])
  end

  private
  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end
end
