class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save!
      login!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    # redirect_url user_url(@user)
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end