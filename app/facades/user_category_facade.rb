class UserCategoryFacade
  def get_categories(user_id)
    category_ids = get_category_ids(user_id)
    find_categories(category_ids)
  end

  def get_category_ids(user_id)
    UserCategory.where(user_id: user_id).pluck(:category_id)
  end

  def find_categories(category_ids)
    Category.where(id: category_ids)
  end
end