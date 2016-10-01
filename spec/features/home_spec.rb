require 'rails_helper'

RSpec.feature 'Visiting the home page', type: :feature do
  scenario 'Visitor sees the company name' do
    visit root_path
    expect(page).to have_text('Find and book vacation rentals with Junket')
  end
end
