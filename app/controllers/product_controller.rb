class ProductController < ApplicationController
  skip_before_action :verify_authenticity_token
  def add
    @product = Product.new(product_params)
    if @product.valid?
      update_image
      @product.save
      render json: { message: "Product added succesfully", product: @product }, status: 201
    else
      render json: @product.errors.details, status: 401
    end
  end
  
  private
  def product_params
    params.permit(:name, :description, :image_url, :price, :category_id)
  end

  def update_image
      upload_image = Cloudinary::Uploader.upload(params["image_url"], :width=>300, :height=>300, :crop=>"scale")
      @product.image_url = upload_image["url"]
  end
end