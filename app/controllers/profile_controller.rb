class ProfileController < ApplicationController
  skip_before_action :verify_authenticity_token

  def user_profile
      user_profile = User.find_by(:id = params[:user_id])
    if user_profile.present?
      render json: { message: "User details fetched succesfully", user: user_profile}, status: 200
    else
      render json: user_profile.errors.details, status: 401
    end
  end
end