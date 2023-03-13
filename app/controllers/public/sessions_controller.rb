# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :sign_in_check, only: [:create]
  #def after_sign_in_path for(resource)

  #end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def sign_in_check
    ## 【処理内容1】 アカウントを取得する。もし登録していなかったらこのメッドを終了する。
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer

    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別。もし一致していたら退会していないか調べる。
    if @customer.valid_password?(params[:customer][:password])
      if @customer.is_active==false
        redirect_to new_customer_registration_path
      end

      return if !@customer
    end

  end

end
