# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :configuration_location, :class => 'Configuration::Location' do
    configurable_location nil
    radius 1.5
  end
end
