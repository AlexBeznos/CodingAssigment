FactoryGirl.define do
  sequence(:email) { |n| "#{n}@yahoo.com" }
  factory :user do
    email
    password "78951213qq"
  end
end
