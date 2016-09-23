FactoryGirl.define do
  factory :sale do
    email "MyString"
    guid ""
    product nil
    stripe_id "MyString"
  end
  factory :product do
    name "MyString"
    permalink "MyString"
    description "MyText"
    price 1
    user nil
  end
  factory :user do
    
  end
end
