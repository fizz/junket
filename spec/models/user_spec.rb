require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'has a valid factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }

    describe 'associations' do
      it { should have_one(:profile) }
      it { should have_many(:hotels) }
    end
  end

end
