class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.new(signup_params)
    
    if @user.valid? 
      existing_user = User.find_by(:email => params[:email])
      if(existing_user.present?)
        render json: { message: "User with Email: " + params[:email] + " already exist" }, status: 401
      else
        @user.save
        render json: @user, status: 201
      end
    else
      render json: @user.errors.details, status: 500
    end
  end

  private
  def signup_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone)
  end
end
