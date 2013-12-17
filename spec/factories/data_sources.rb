# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_source do
    map

    sequence(:name)  { |n| "Data Source #{n}" }
    sequence(:description) { |n| "data description #{n}"}

    sequence(:email) { |n| "data_source#{n}@mapsndata.com"}
    sequence(:url) { |n| "www.data_source_#{n}.mapsndata.com" }

    contact_name { |n| "Contact #{n}" }
    address { |n| "Address # #{n}" }

    longitude "1.11"
    latitude "2.22"
    x_pos "3.33"
    y_pos "4.44"
    x_width "5.55"
    y_width "6.66"

  end
end
