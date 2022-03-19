class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer

  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  #退会画面
  def unsubscribe
    @customer = current_customer
  end

  #退会機能
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :phone_number, :postal_code, :is_deleted)
  end
end
