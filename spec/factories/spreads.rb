# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spread do
    spreadable nil
    spread_publishable nil
    action "MyString"
  end
end
