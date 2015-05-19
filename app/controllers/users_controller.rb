class UsersController < ApplicationController

  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(new_user_params)

      if @user.save
        redirect_to users_path, notice: 'User was successfully created.'
      else
        render :new 
      end
  end
  
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
  
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
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
  def new_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  

end