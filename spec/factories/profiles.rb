FactoryGirl.define do
  factory :profile do
    bio { FFaker::Lorem.paragraphs(2) }
    user
  end
end
