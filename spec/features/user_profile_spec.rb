require 'rails_helper'
include Features::SessionHelpers

RSpec.feature "UserProfile", type: :feature do
  let(:user) {FactoryGirl.create(:user)}
  before do
    visit new_user_session_path
    sign_in(user)
  end
  scenario "host creates profile" do
    visit new_user_profile_path(user)
    # fill_in_signin_fields
    # binding.pry
    fill_in "profile[bio]", with: FFaker::Lorem.paragraph(2)
    click_button "Create Profile"
    expect(page).to have_content("Profile was successfully created.")
  end
  def fill_in_signin_fields
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
  end
end
