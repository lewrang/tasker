FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "John#{n}"}
    sequence(:last_name) { |n| "Smith#{n}"}
    sequence(:email) { |n| "johns#{n}@gmail.com"}
    password 'password'
  end
  factory :admin, class: User do
    sequence(:first_name) { |n| "John#{n}"}
    sequence(:last_name) { |n| "Smith#{n}"}
    sequence(:email) { |n| "admin#{n}@gmail.com"}
    admin true
    password 'password'
  end
end