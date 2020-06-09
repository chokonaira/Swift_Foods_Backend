class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.new(signup_params)
    
    if @user.valid? 
      @user.save
      render json: @user, status: 201
    else
      render json: @user.errors.details, status: 500
    end
  end

  private
  def signup_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone)
  end
end
