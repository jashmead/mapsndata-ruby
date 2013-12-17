# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :map do
    user
    map_type "blank"

    sequence(:name)  { |n| "Map #{n}" }
    sequence(:description) { |n| "legend #{n}"}
  end
end
