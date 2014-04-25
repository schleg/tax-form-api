# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentication_token do
    token 'TEST_TOKEN_1'
    expiry_at { DateTime.now.advance(days: 1) }
  end
end
