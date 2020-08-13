class UserController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_request, only: [:index, :signup, :login]

  def signup
    user = User.new(signup_params)
    if user.valid? 
        user.save
        token = JsonWebToken.encode({ "id" => user.id, "email" => user.email })
        render json: { message: "Signup succesful", token: token }, status: 201
    else
      render json: @user.errors.details, status: 500
    end
  end


  def login
    user = User.authenticate(login_params[:email], login_params[:password])
    if user
      token = JsonWebToken.encode({ "id" => user.id, "email" => user.email})
      render json: { message: "Login succesful", "token": token, id: user.id }, status: 200
    else
      render json: { error: "Invalid email or password", status: 403 }, :status => :forbidden
    end
  end


  private
  def signup_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :phone)
  end
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
