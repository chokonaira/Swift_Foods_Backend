class ProfileController < ApplicationController

  def user_profile
      user_profile = User.find_by(:id => params[:id])
    if user_profile.present?
      render json: { message: "User details fetched succesfully", user: user_profile}, status: 200
    else
      render json: user_profile.errors.details, status: 401
    end
  end

  def update_user_image
    user = User.find(params[:id])
    if user.present?
      upload_image = Cloudinary::Uploader.upload(params["image_url"], :width=>300, :height=>300, :crop=>"scale")
      photo = { image_url: upload_image["url"] }
      user.update!(photo)
      render json: { message: "Users image uploaded succesfully", url: upload_image["url"] }, status: 200
    else
      render json: { error: "Internal server error" }, status: 500
    end
  end
end