# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do

    sequence(:name)  { |n| "User #{n}" }
    sequence(:email) { |n| "user_#{n}@mapsndata.com"}

    password "user1234"
    password_confirmation "user1234"

    sequence(:description) { |n| "description_#{n}" }
    sequence(:url) { |n| "www.user_#{n}.mapsndata.com" }

  end
end
