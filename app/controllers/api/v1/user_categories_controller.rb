class Api::V1::UserCategoriesController < ApplicationController
  def create
    u_category = UserCategory.find_by(user_id: params[:user_id], category_id: params[:category_id] )

    if u_category.nil?
      new_user_category = UserCategory.create(user_id: params[:user_id], category_id: params[:category_id])
      render json: UserCategorySerializer.new(new_user_category), status: 201
    end

  end

  def destroy
    u_category = UserCategory.find_by(user_id: params[:user_id], category_id: params[:category_id] )

    if u_category
      u_category.destroy
    end
  end
end