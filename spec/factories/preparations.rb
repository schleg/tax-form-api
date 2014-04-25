# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :preparation do
    year 2014

    factory :F1040_preparation do
      age 64
      spouse_age 64
      taxable_income 100000 
      interest_income 1499
      itemizing_deductions true
    end

    factory :F1040EZ_preparation do
      age 64
      spouse_age 64
      taxable_income 99999
      interest_income 1499
      itemizing_deductions false
    end
  end
end
