module Rules

  class TaxFormRulebook < Ruleby::Rulebook

    def rules

      rule :F1040, { priority: 100 },
        [Preparation, :p, { m.id => :id }, 
          m.itemizing_deductions == true
        ] { |v|

          assert TaxForm.add_to_preparation(preparation_id: v[:id], name: 'F1040')
        }

      rule :F1040EZ, { priority: 100 },
        [Preparation, :p, { m.id => :id }, 
          m.age < 65, 
          m.spouse_age < 65,
          m.taxable_income < 100000,
          m.interest_income < 1500,
          m.itemizing_deductions == false
        ] { |v|

          assert TaxForm.add_to_preparation(preparation_id: v[:id], name: 'F1040EZ')
        }
    end
  end
end
