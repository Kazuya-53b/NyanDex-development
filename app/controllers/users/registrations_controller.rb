# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]
  before_action :configure_account_update_params, only: [ :update ]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  def cancel
    super
  end

  protected

  # 追加のパラメータを許可する場合は、ここに追加します。
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username, :email, :password, :password_confirmationn ])
  end

  # アカウント更新時のパラメータを許可する
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username, :email, :password, :password_confirmation, :current_password ])
  end

  # サインアップ後のリダイレクト先
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # 非アクティブなアカウントのサインアップ後のリダイレクト先
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
