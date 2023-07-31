class  Api::V1::CategoriesController < ApplicationController
  def index
    render json: CategorySerializer.new(Category.all)
  end
end