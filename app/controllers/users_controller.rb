class UsersController < ApplicationController
  layout 'navbar'

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = 'Your profile information was updated.'
      redirect_to @user
    else
      render 'devise/registrations/edit', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :full_name, :about, :avatar)
  end
end
