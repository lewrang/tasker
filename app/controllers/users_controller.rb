class UsersController < ApplicationController

  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      sign_in @user, :bypass => true
      redirect_to edit_user_path, notice: 'Your data was successfully updated.'
    else
      render "edit"
    end
  end

  private

  def user_params
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
  end

end