require 'rails_helper'

RSpec.describe HotelPolicy do
  subject { described_class.new(user, hotel) }

  let(:hotel) {FactoryGirl.create(:hotel)}

  context "being logged out" do
    let(:user) { nil }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_action :index }
    it { is_expected.to forbid_action :destroy }
    it { is_expected.to permit_action :show }
  end

  context "being logged in, own hotel" do
    let(:user) {FactoryGirl.create(:user, :with_hotels)}
    let(:hotel) {user.hotels.first}

    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_action :index}
    it { is_expected.to permit_action :destroy}
    it { is_expected.to permit_action :show}
  end

  context "being logged in, others' hotels" do
    let(:user) {FactoryGirl.create(:user)}
    let(:hotel) {FactoryGirl.create(:hotel)}

    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_action :index}
    it { is_expected.to forbid_action :destroy}
    it { is_expected.to permit_action :show}
  end

  context "being logged in as an admin" do
    let(:user) {FactoryGirl.create(:user, :admin)}
    let(:hotel) {FactoryGirl.create(:hotel)}

    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_action :index}
    it { is_expected.to permit_action :destroy}
    it { is_expected.to permit_action :show}
  end
end
