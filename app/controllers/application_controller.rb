# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected
    def configure_permitted_parameters
      added_attrs = [:nickname, :full_name, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
