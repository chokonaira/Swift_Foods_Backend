class UserController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_request, only: [:index, :signup, :login]

  def signup
    @user = User.new(signup_params)
    if @user.valid? 
        encript_password(params[:password])
        @user.save
        token = JsonWebToken.encode({ "id" => @user.id, "email" => @user.email })
        render json: { message: "Signup succesful", token: token }, status: 201
    else
      render json: @user.errors.details, status: 500
    end
  end


  def login
    auth_user = authenticate_user(login_params[:email], login_params[:password])
    if auth_user
      user_id = auth_user.id
      token = JsonWebToken.encode({ "id" => user_id, "email" => login_params[:email]})
      render json: { message: "Login succesful", "token": token, "id": user_id }, status: 200
    else
      render json: { error: "Internal server error" }, status: 500
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
    return decripted_password
  end
  def authenticate_user(email, password)
    auth_user = User.find_by_email!(email)
    if auth_user.present?
      database_password = auth_user.password
      decripted_password = decript_password(database_password)
      if decripted_password == password
        return auth_user 
      else
        render json: { error: "Invalid password, try again"},  status: 401 
      end
    else
      render json: { error: "User with these credentials does now exist" }, status: 404 
    end
  end
end
