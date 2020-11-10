class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admins_calendars_path
      when User
        calendars_path
      end
    end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end



  private
  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :first_name_kana,:family_name_kana, :post_code, :address, :telephone,:email, :encrypted_password, :facility_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
  end



end
