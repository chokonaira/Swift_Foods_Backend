class ProductController < ApplicationController
  def add
    @product = Product.new(product_params)


  end

  def product_params
    params.require(:product).permit(:name, :description, :image_url, :price, :category_id)
  end
end
