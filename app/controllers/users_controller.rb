# frozen_string_literal: true

class UsersController < ApplicationController
  layout "navbar", except: [:welcome]
  layout "wibio_pages", only: [:page]
  skip_before_action :authenticate_user!, only: [:page]

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "Your profile information was updated."
      redirect_to edit_user_registration_path
    else
      # Using redirect here instead of render since we want the devise controller to handle this page
      flash[:alert] = @user.errors.full_messages.first
      redirect_to edit_user_registration_path
    end
  end

  # Main public user page
  def page
    @user = User.find_by! nickname: params[:nickname]
  end

  # To redirect users after sign up and fill final user details
  def welcome
    @user = current_user
  end

  # Handles form updates for welcome page. It redirect always to home to be a seamless step.
  def finish_welcome
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = "You are ready to go!"
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
