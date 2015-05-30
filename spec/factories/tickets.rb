FactoryGirl.define do
  factory :ticket do
    sequence(:title) { |n| "Title#{n}"}
    sequence(:description) { |n| "Description#{n}"}
    priority 2
    difficulty_level 2
    status 2
  end
end