class Admin::CustomersController < ApplicationController


  def index
    @customers = Customer.page(params[:page])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end


  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path
    else
     flash[:notice] = "会員情報が正しく保存されませんでした"
     redirect_to edit_admin_customer_path(@customer)
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number,:is_deleted)
  end
end
