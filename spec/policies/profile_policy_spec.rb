require 'rails_helper'

RSpec.describe ProfilePolicy do
  subject {described_class.new(user, profile)}

  let(:profile) {FactoryGirl.create(:profile)}

  context "being logged out" do
    let(:user) {nil}
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_action :index }
    it { is_expected.to forbid_action :destroy }
    it { is_expected.to forbid_action :show }
  end

  context "being logged in, own profile" do
    let(:user) {FactoryGirl.create(:user, :with_profile)}
    let(:profile) {user.profile}

    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_action :index}
    it { is_expected.to permit_action :destroy}
    it { is_expected.to permit_action :show}
  end

  context "being logged in, others' profiles" do
    let(:user) {FactoryGirl.create(:user)}
    let(:profile) {FactoryGirl.create(:profile)}

    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_action :index}
    it { is_expected.to forbid_action :destroy}
    it { is_expected.to permit_action :show}
  end
end
