class Public::CustomersController < ApplicationController

  def quit
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
      if @customer.update(customer_params)
        flash[:update] = "You have updated user info successfully."
        redirect_to customer_path(@customer.id)
      else
        render 'edit'
      end
  end

  def out
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
　　redirect_to root_pathth
  end

  private
    def customer_params
      params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number)
    end


end
