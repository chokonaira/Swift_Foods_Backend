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

  def get_all
    categories = Category.all.order(:id)
    if categories
      render json: { message: "Categories fetched succesfully", "categories": categories }, status: 200
    else
      render json: { message: "Categories empty" }, status: 203
    end
  end

  def update
    category = Category.find_by(:id => params[:id])
    if category 
      category_name = {:name => params[:name]}
      category.update(category_name)
      render json: { message: "Category updated succesfully", "category": category }, status: 200
    else
      render json: { message: "Category does not exist" }, status: 404
    end
  end
  private
  def category_param
    params.require(:category).permit(:name)
  end
end
