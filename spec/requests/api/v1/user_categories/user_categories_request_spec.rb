require "rails_helper"

RSpec.describe "UserCategories" do
  describe "create a user_category" do
    it "creates and saves a category to a user" do
      params = {
        user_id: "1234",
        category_id: create(:category).id
      }

      post "/api/v1/user_categories?user_id=#{params[:user_id]}&category_id=#{params[:category_id]}"

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
      expect(created_user_category[:data][:attributes][:user_id]).to be_a(String)

      expect(created_user_category[:data][:attributes]).to have_key(:category_id)
      expect(created_user_category[:data][:attributes][:category_id]).to be_a(String)
    end
  end
end