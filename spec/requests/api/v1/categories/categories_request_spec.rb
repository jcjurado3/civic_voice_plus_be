require "rails_helper"

RSpec.describe "Category Endpoints" do
  describe "get all categories" do
    it "list all categories" do
      list_categories = create_list(:category, 10)

      get "/api/v1/categories"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      category_data = JSON.parse(response.body, symbolize_names: true)

      expect(category_data).to have_key(:data)
      expect(category_data[:data]).to be_an(Array)
      expect(category_data[:data].count).to eq(10)

      category_data[:data].map do |cat|
        expect(cat).to have_key(:id)
        expect(cat[:id]).to be_a(String)

        expect(cat).to have_key(:type)
        expect(cat[:type]).to be_a(String)
        expect(cat[:type]).to eq("category")

        expect(cat).to have_key(:attributes)
        expect(cat[:attributes]).to be_a(Hash)

        expect(cat[:attributes]).to have_key(:name)
        expect(cat[:attributes][:name]).to be_a(String)
      end
    end
  end

  describe "get one category" do
    it "list one category" do
      cat1 = create(:category)

      get "/api/v1/categories/#{cat1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      cat_data = JSON.parse(response.body, symbolize_names: true)

      expect(cat_data).to have_key(:data)
      expect(cat_data.count).to eq(1)
      expect(cat_data[:data]).to be_an(Hash)

      expect(cat_data[:data]).to have_key(:id)
      expect(cat_data[:data][:id]).to be_a(String)

      expect(cat_data[:data]).to have_key(:type)
      expect(cat_data[:data][:type]).to be_a(String)
      expect(cat_data[:data][:type]).to eq("category")

      expect(cat_data[:data]).to have_key(:attributes)
      expect(cat_data[:data][:attributes]).to be_a(Hash)

      expect(cat_data[:data][:attributes]).to have_key(:name)
      expect(cat_data[:data][:attributes][:name]).to be_a(String)
    end
  end
end