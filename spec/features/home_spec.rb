require 'rails_helper'

# RSpec.feature "Home", type: :feature do
feature 'visiting the home page' do
  scenario 'the visitor sees the company name' do
    visit root_path
    expect(page).to have_text('Find and book vacation rentals with Junket')
  end
end
# end
