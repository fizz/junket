require 'rails_helper'

RSpec.describe HotelPolicy do
  let(:user) { User.new }

  subject { described_class }

  context "for a visitor" do
    let(:user) { nil }
    let(:hotel) { FactoryGirl.create(:hotel) }
    permissions :index?, :show?, :new?, :edit?, :create?, :update?, :destroy? do
      it "does not grant access for non logged in visitors" do
        expect(subject).not_to permit(user, hotel )
      end
    end
  end

  context "for user viewing other users’ hotels or creating a hotel" do
    let(:hotel) { FactoryGirl.create(:hotel) }
    let(:user) { FactoryGirl.create(:user) }

    permissions :index?, :show?, :new?, :create? do
      it "grants access to user" do
        expect(subject).to permit(user, hotel)
      end
    end

    permissions :edit?, :update?, :destroy? do
      it "denies access to user for whom the hotel does not belong" do
        expect(subject).not_to permit(user, hotel )
      end
    end
  end

  context "for user editing own hotel" do
    let(:user) { FactoryGirl.create(:user) }
    permissions :edit?, :update?, :destroy? do
      it "grants access if hotel belongs to user" do
        expect(subject).to permit(user, Hotel.create!(user_id: user.id, name: 'Lorem Ipsum'))
      end
    end
  end


end
