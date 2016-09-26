require 'rails_helper'

RSpec.feature "UserSession", type: :feature do
  let(:user) {FactoryGirl.create(:user)}
  scenario 'User visits the site to log in' do
    visit root_path
    click_link 'Log In'
    fill_in_signin_fields
    expect(page).to have_content('Signed in successfully.')
  end
  scenario 'User logs out of the site' do
    visit root_path
    fill_in_signin_fields
    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully.')
  end
  def fill_in_signin_fields
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
  end
end
