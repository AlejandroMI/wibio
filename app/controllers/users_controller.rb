class UsersController < ApplicationController
  layout 'navbar', except: [:welcome]

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = 'Your profile information was updated.'
      redirect_to @user
    else
      render 'devise/registrations/edit', status: :unprocessable_entity
    end
  end

  # To redirect users after sign up and fill final user details
  def welcome
    redirect_to root_path unless request.referrer&.end_with?('/users/sign_up') || Rails.env.development?
    @user = current_user
  end

  # Handles form updates for welcome page. It redirect always to home to be a seamless step.
  def finish_welcome
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = 'You are ready to go!'
    else
      flash[:alert] = "Done... but some details couldn't be saved. You can change them later in settings."
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :full_name, :about, :avatar)
  end
end
