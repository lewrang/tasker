FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project#{n}"}
    sequence(:description) { |n| "Description#{n}"}
  end
end