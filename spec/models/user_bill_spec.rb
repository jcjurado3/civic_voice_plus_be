require 'rails_helper'

RSpec.describe UserBill, type: :model do
  describe "relationships" do
    it { should belong_to :bill }
  end
end
