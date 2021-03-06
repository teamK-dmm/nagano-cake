class Admin::CustomersController < ApplicationController

  # before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to edit_admin_customer_path(@customer), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :phone_number, :postal_code, :is_deleted, :email)
  end

end
