# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    text "MyString"
    alternatives ""
    answers ""
    extra ""
  end
end
