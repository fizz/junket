FactoryGirl.define do
  factory :hotel do
    name "MyString"
    address_1 "MyString"
    address_2 "MyString"
    city "MyString"
    region "MyString"
    zip_code "MyString"
    country "MyString"
    description "MyText"
    user
  end
end
