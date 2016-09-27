require 'rails_helper'

RSpec.describe ProfilePolicy do

  let(:user) { User.new }

  subject { described_class }

  context "for a visitor" do
    let(:user) { nil }
    let(:profile) { FactoryGirl.create(:profile) }
    permissions :index?, :show?, :new?, :edit?, :create?, :update?, :destroy? do
      it "does not grant access for non logged in visitors" do
        expect(subject).not_to permit(user, profile )
      end
    end
  end

  context "for user viewing other users’ profiles or creating a profile" do
    let(:profile) { FactoryGirl.create(:profile) }
    let(:user) { FactoryGirl.create(:user) }

    permissions :index?, :show?, :new?, :create? do
      it "grants access to user" do
        expect(subject).to permit(user, profile)
      end
    end

    permissions :edit?, :update?, :destroy? do
      it "denies access to user for whom the profile does not belong" do
        expect(subject).not_to permit(user, profile )
      end
    end
  end

  context "for user editing own profile" do
    let(:user) { FactoryGirl.create(:user) }
    permissions :edit?, :update?, :destroy? do
      it "grants access if profile belongs to user" do
        expect(subject).to permit(user, Profile.create!(user_id: user.id, bio: 'Lorem Ipsum'))
      end
    end
  end

end
