FactoryGirl.define do
  factory :hotel do
    name FFaker::Venue.name
    address_1 FFaker::Address.street_address
    address_2 FFaker::Address.secondary_address
    city FFaker::Address.city
    region FFaker::AddressUS.state
    zip_code FFaker::AddressUS.zip_code
    country "United States"
    description FFaker::Lorem.paragraph(2)
    user
  end
end
