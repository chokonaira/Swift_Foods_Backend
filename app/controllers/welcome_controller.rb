class WelcomeController < ApplicationController
  def index
    render json: { message: "Welcome to Henry Food App" }, status: 200
  end
end
