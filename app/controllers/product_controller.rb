class ProductController < ApplicationController
  skip_before_action :verify_authenticity_token

  def add_a_product
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      render json: { message: "Product added succesfully", product: @product }, status: 201
    else
      render json: @product.errors.details, status: 401
    end
  end
  
  def get_a_product_details
    product = Product.find_by(:id => params[:id])
    if product.present?
      render json: { message: "Product fetched succesfully", product: product, product_category: product.category }, status: 200
    else
      render json: product.errors.details, status: 401
    end
  end

  def get_all_products
    products = Product.all.order(:id)
    if products.present?
      render json: { message: "Products fetched succesfully", products: products }, status: 200
    else
      render json: { message: "Products empty", products: [] }, status: 200
    end
  end

  def update_a_product_details
    product = Product.find(params[:id])
    if product.present?
      payload = JSON.parse(request.body.read)
      update_detail = custom_compact(payload)
      product.update!(update_detail)
      render json: { message: "Products details updated succesfully", 
                     product: product }, 
                     status: 200
    else
      render json: product.errors.details, status: 401
    end
  end

  def update_food_image
    product = Product.find(params[:id])
    if product.present?
      upload_image = Cloudinary::Uploader.upload(params["image_url"], :width=>300, :height=>300, :crop=>"scale")
      photo = { image_url: upload_image["url"] }
      product.update!(photo)
      render json: { message: "Product image uploaded succesfully", url: upload_image["url"] }, status: 200
    else
      render json: { error: "Internal server error" }, status: 500
    end
  end

  def delete_a_product
    product = Product.find_by(:id => params[:id])
    if product 
      Product.delete(product)
      render json: { message: "Product deleted succesfully" }, status: 200
    else
      render json: { message: "Product does not exist" }, status: 404
    end
  end
  private

  def custom_compact(payload)
    payload.reject { |_, value| value.empty? }
  end

  def product_params
    params.permit(:name, :description, :price, :delivery_fee, :category_id)
  end
end

