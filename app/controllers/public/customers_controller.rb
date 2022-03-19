class Public::CustomersController < ApplicationController

  def show
    @customer =　current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
    if @user == current_customer
       render :edit
    else
       redirect_to customer_path(current_user.id)
    end
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
  def unsubscride
    @customer = Customer.find(params[:id])
  end

  #退会機能
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  
  private


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :adress, :phone_number, :postal_code, :is_deleted)
  end
end
