class CategoryController < ApplicationController
  def add
    @category = Category.new(category_param)

    if @category.valid?
      existing_category = Category.find_by(:name => params[:name])
      if existing_category.present?
        render json: { message: "Category: " + params[:name] + " already exist" }, status: 401
      else
        @category.save
        render json: { message: "Category: " + params[:name] + ", added succesfully"}, status: 201
      end
    else
      render json: @category.errors.details, status: 500
    end
  end

  private
  def category_param
    params.require(:category).permit(:name)
  end
end
