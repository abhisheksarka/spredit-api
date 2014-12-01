# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jw_token do
    value "MyString"
    ip_address "MyString"
    jw_tokenable nil
  end
end
