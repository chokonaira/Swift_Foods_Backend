class WelcomeController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]

  def index
    render json: { message: "Welcome to CHOKO Swift Foods" }, status: 200
  end
end
