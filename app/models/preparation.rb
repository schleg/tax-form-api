class Preparation < ActiveRecord::Base

  require 'ruleby'
  include Ruleby

  has_many :tax_forms

  attr_accessor \
    :age,
    :spouse_age,
    :taxable_income,
    :interest_income,
    :income_source_approved,
    :itemizing_deductions

  def run_form_rules
    engine :engine do |e|
      Rules::TaxFormRulebook.new e do |r|
        r.rules
      end
      e.assert self
      e.match
    end
  end
end
