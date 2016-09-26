require 'rails_helper'

RSpec.feature "UserProfile", type: :feature do
  let(:user) {FactoryGirl.create(:user)}

  scenario "host creates profile" do
    visit new_user_profile_path(user)
    fill_in "profile[bio]", with: FFaker::Lorem.paragraph(2)
    click_button "Create Profile"
    expect(page).to have_content("Profile was successfully created.")
  end
end
