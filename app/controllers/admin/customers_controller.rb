class Admin::CustomersController < ApplicationController


  def index
    @customer = Customer.page(params[:page])
  end

  def edit
  end

  def show
  end
end
