require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "relationship" do
    it { should have_many :user_categories }
  end
end
