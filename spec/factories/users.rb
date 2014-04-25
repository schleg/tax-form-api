# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'password'
    password_confirmation 'password'

    factory :user_with_auth_token do
      after(:create) do |user, evaluator|
        create(:authentication_token, user: user)
      end
    end
  end
end
