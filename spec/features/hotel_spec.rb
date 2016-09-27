require 'rails_helper'

RSpec.feature "Hotel", type: :feature do
 let(:user) {FactoryGirl.create(:user)}

 before do
  login_as(user, scope: :user)
 end

 scenario "host creates hotel" do
  visit new_user_hotel_path(user)
  fill_in "hotel[name]", with: FFaker::Venue.name
  fill_in "hotel[address_1]", with: FFaker::Address.street_address
  fill_in "hotel[address_2]", with: FFaker::Address.secondary_address
  fill_in "hotel[city]", with: FFaker::Address.city
  fill_in "hotel[region]", with: FFaker::AddressUS.state
  fill_in "hotel[zip_code]", with: FFaker::AddressUS.zip_code
  select "United States", from: "Country"
  fill_in "hotel[description]", with: FFaker::Lorem.paragraph(2)
  hotel_pic_path = 'spec/fixtures/files/hotel_pic.jpg'
  attach_file "hotel[hotel_pic]", hotel_pic_path
  click_button "Create Hotel"
  expect(page).to have_content("Hotel was successfully created.")
 end
end
