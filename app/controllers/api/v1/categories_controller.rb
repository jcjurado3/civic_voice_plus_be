class  Api::V1::CategoriesController < ApplicationController
  def index
    render json: CategorySerializer.new(Category.all)
  end

  def show
    render json: CategorySerializer.new(Category.find(params[:id]))
  end
end