require "rails_helper"

RSpec.describe "UserCategories" do
  describe "get all UserCategories for a user" do
    it "returns all UserCategories for a user" do
      user1_id = "1"
      category1 = Category.create!(name: "artificial intelligence")
      category2 = Category.create!(name: "climate")
      user_category_1 = UserCategory.create!(user_id: user1_id, category_id: category1.id)
      user_category_2 = UserCategory.create!(user_id: user1_id, category_id: category2.id)

      get "/api/v1/user_categories?user_id=#{user1_id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      expect(data).to have_key(:data)
    end
  end

  describe "create a user_category" do
    it "creates and saves a category to a user" do
      user1_id = "1"

      category1 = Category.create!(name: "artificial intelligence")

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post "/api/v1/user_categories?user_id=#{user1_id}&category_id=#{category1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(201)

      created_user_category = JSON.parse(response.body, symbolize_names: true)

      expect(created_user_category).to be_a(Hash)
      expect(created_user_category).to have_key(:data)
      expect(created_user_category[:data]).to have_key(:id)
      expect(created_user_category[:data][:id]).to be_a(String)

      expect(created_user_category[:data]).to have_key(:type)
      expect(created_user_category[:data][:type]).to be_a(String)
      expect(created_user_category[:data][:type]).to eq("user_category")

      expect(created_user_category[:data]).to have_key(:attributes)
      expect(created_user_category[:data][:attributes]).to have_key(:user_id)
      expect(created_user_category[:data][:attributes][:user_id]).to be_an(Integer)

      expect(created_user_category[:data][:attributes]).to have_key(:category_id)
      expect(created_user_category[:data][:attributes][:category_id]).to be_an(Integer)
    end
  end

  describe "destroys a user_category association" do
    it "can remove a user_category association" do
      user1_id = "1"
      user2_id = "2"

      category1 = Category.create!(name: "artificial intelligence")
      category2 = Category.create!(name: "climate")

      user_category_1 = UserCategory.create!(user_id: user1_id, category_id: category1.id)
      user_category_2 = UserCategory.create!(user_id: user1_id, category_id: category2.id)

      headers = { 'CONTENT_TYPE' => 'application/json' }

      user_categories = UserCategory.count

      delete "/api/v1/user_categories?user_id=#{user1_id}&category_id=#{category1.id}", headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(UserCategory.count).to eq(user_categories - 1)
    end
  end
end