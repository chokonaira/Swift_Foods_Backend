class ProductController < ApplicationController
  skip_before_action :verify_authenticity_token
  def add_a_product
    @product = Product.new(product_params)
    if @product.valid?
      upload_image
      @product.save
      render json: { message: "Product added succesfully", product: @product }, status: 201
    else
      render json: @product.errors.details, status: 401
    end
  end
  def get_a_product_details
    product = Product.find_by(:id => params[:id])
    if product
      render json: { message: "Product fetched succesfully", product: product }, status: 200
    else
      render json: product.errors.details, status: 401
    end
  end

  def get_all_products
    products = Product.all.order(:id)
    if products
      render json: { message: "Products fetched succesfully", "Products": products }, status: 200
    else
      render json: { message: "Products empty", "Products": [] }, status: 203
    end
  end

  def update_a_product_details
    @product = Product.find(params[:id])
    if @product
      @product.update!(product_params)
      upload_image
      @product.save
      render json: { message: "Products details updated succesfully", "Product": @product }, status: 200
    else
      render json: @product.errors.details, status: 401
    end
  end
  
  private
  def custom_compact(payload)
    payload.reject { |_, value| value.empty? }
  end

  def product_params
    params.permit(:name, :description, :image_url, :price, :category_id)
  end

  def upload_image
      upload_image = Cloudinary::Uploader.upload(params["image_url"], :width=>500, :height=>500, :crop=>"scale")
      @product.image_url = upload_image["url"]
  end
end