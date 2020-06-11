class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.new(signup_params)
    
    if @user.valid? 
      existing_user = User.find_by(:email => params[:email])
      if existing_user.present?
        render json: { message: "User with Email: " + params[:email] + " already exist" }, status: 401
      else
        token = JsonWebToken.encode({ "id" => @user.id, "email" => @user.email })
        encript_password(params[:password])
        @user.save
        render json: { message: "Signup succesful", token: token }, status: 201
      end
    else
      render json: @user.errors.details, status: 500
    end
  end

  private
  def signup_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone)
  end
  def login_params
    params.require(:user).permit(:email, :password)
  end
  def encript_password(password)
    encripted_password = BCrypt::Password.create(password)
    @user.password = encripted_password
  end
  def decript_password(password)
    decripted_password = BCrypt::Password.new(password)
    @user.password = decripted_password
  end
end
