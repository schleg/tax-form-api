class Preparation < ActiveRecord::Base

  require 'ruleby'
  include Ruleby

  require 'rules'
  include Rules

  has_many :tax_forms

  def run_form_rules
    tax_forms.destroy_all
    engine :engine do |e|
      Rules::TaxFormRulebook.new e do |r|
        r.rules
      end
      e.assert self
      e.match
    end
  end
end
