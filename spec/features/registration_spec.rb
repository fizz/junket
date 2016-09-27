require 'rails_helper'
include Features::SessionHelpers

feature 'user registers for site' do
  scenario 'user registers' do
    visit root_path
    click_link 'Register'
    sign_up_with(FactoryGirl.create(:user))
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
