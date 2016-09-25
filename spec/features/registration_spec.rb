require 'rails_helper'

feature 'user registers for site' do
  scenario 'user registers' do
    visit root_path
    click_link 'Register'
    fill_in_registration_fields
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  def fill_in_registration_fields
    fill_in "user[name]", with: FFaker::Name.name
    fill_in "user[email]", with: FFaker::Internet.email
    fill_in "user[password]", with: Devise.friendly_token.first(8)
    click_button "Sign up"
 end
end
