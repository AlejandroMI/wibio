class RegistrationsController < Devise::RegistrationsController

  protected

  # After updating user devise attributes don't take users to root and stay in page
  def after_update_path_for(resource)
    user_path(resource)
  end
end