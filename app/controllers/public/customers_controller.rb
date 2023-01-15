class Public::CustomersController < ApplicationController

  def quit
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

end
