class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]) #allを無くしても大丈夫？kaminariがconfigに無い
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_user #ifを質問する
       render :edit
    else
       redirect_to customer_path(current_user.id)
    end
  end

  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to edit_admin_customer_path(@customer), notice: "You have updated user successfully."
    else
      render :edit #renderでadminを呼び出す方法を質問
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :adress, :phone_number, :postal_code, :is_deleted)
  end

end
