require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryGirl.create(:hotel)).to be_valid
    end
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { should belong_to(:user) }
  end
end
