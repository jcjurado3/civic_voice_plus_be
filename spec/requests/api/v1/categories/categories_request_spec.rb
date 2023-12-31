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

  describe "creates a category" do
    it "creates a new category" do
      category_params = ({
        name: "healthcare"
      })

      headers = { "CONTENT_TYPE" => "application/json "}
      post "/api/v1/categories", headers: headers, params: JSON.generate(category: category_params)

      created_category = Category.last

      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(created_category.name).to eq(category_params[:name])
    end
  end

  describe "update an existing category" do
    it "updates a category" do
      category_1 = Category.create!(name: "heathcare")

      edit_category_params = {
        name: "healthcare"
      }

      headers = { "CONTENT_TYPE" => "application/json "}
      patch "/api/v1/categories/#{category_1.id}", headers: headers, params: JSON.generate(category: edit_category_params)

      updated_category = Category.find_by(id: category_1.id)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(updated_category.name).to eq("healthcare")
      expect(updated_category.name).to_not eq(category_1.name)
    end
  end
end