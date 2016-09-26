FactoryGirl.define do
  factory :profile do
    bio "MyText"
    user
  end
  factory :user do
    name FFaker::Name.name
    email FFaker::Internet.email
    password Devise.friendly_token.first(8)
  end
end
