# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :configuration_post_category, :class => 'Configuration::PostCategory' do
    value "MyString"
    configurable_post_category nil
  end
end
