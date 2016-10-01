require 'rails_helper'
include Features::SessionHelpers

RSpec.feature "UserProfile", type: :feature do
  let(:user) {FactoryGirl.create(:user)}

  before do
    visit new_user_session_path
    sign_in(user)
  end

  scenario "user creates profile" do
    visit new_user_profile_path(user)
    profile_pic_path = 'spec/fixtures/files/profile_pic.jpg'
    attach_file "profile[profile_pic]", profile_pic_path
    fill_in "profile[bio]", with: FFaker::Lorem.paragraph(2)
    click_button "Create Profile"
    expect(page).to have_content("Profile was successfully created.")
    profile = Profile.last
    expect(profile).to have_attributes(profile_pic_file_name: a_value)
  end
end
