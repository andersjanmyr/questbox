# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz do
    name "MyString"
    randomize_questions ""
    randomize_answers ""
    max_times_to_take_quiz ""
    respond_after "MyString"
    default_theme "MyString"
    questions "MyString"
  end
end
