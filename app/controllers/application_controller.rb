class ApplicationController < ActionController::Base

   before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    # ログイン時のパスを変更してる
    # def after_sign_in_path_for(resource)
    #   if customer_signed_in?
    #     customer_path(resource)
    #   else
    #     admin_top_path
    #   end
    # end

    #ログアウト時のパスの変更
    # def after_sign_out_path_for(resource)
    #  root_path
    # end

    # 新規登録の保存機能
    def configure_permitted_parameters
      if resource_class == Customer
      devise_parameter_sanitizer.permit(:sign_up,keys: [:first_name, :last_name, :first_name_kana, :last_name_kana,:email, :postal_code, :phone_number, :address, :encrypted_password])
      end
      #sign_upの際にnameのデータ操作を許。追加したカラム。
    end

  private

  # before_action作成

  def set_product
    @product = Product.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
