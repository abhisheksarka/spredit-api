# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    sendable nil
    receivable nil
    action "MyString"
    causable nil
  end
end
