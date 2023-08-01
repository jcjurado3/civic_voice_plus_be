class  Api::V1::CategoriesController < ApplicationController
  def index
    render json: CategorySerializer.new(Category.all)
  end

  def show
    render json: CategorySerializer.new(Category.find(params[:id]))
  end

  def create
    render json: CategorySerializer.new(Category.create!(category_params)), status: 201
  end

  def update
    category = Category.find(params[:id])
    category.update!(category_params)
    render json: CategorySerializer.new(category)
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end