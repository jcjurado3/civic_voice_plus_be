require 'rails_helper'

RSpec.describe Bill, type: :model do
  describe "relationships" do
    it { should have_many :user_bills }
  end
end
