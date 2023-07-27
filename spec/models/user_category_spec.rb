require 'rails_helper'

RSpec.describe UserCategory, type: :model do
  describe "relationship" do
    it { should belong_to :category }
  end
end
