class Admin::CustomersController < ApplicationController


  def index
    @customers = Customer.page(params[:page])
  end

  def edit
  end

  def show
  end
end
