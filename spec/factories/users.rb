FactoryGirl.define do
  factory :user do
    name FFaker::Name.name
    email { FFaker::Internet.email }
    password Devise.friendly_token.first(8)
    trait :guest do
      role :guest
    end
    trait :host do
      role :host
    end
    trait :admin do
      role :admin
    end
    trait :with_profile do
      profile
    end
    trait :with_hotels do
      hotels {build_list :hotel, 1}
    end
  end
end
