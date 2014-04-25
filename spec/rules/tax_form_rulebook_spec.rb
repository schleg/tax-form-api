require 'spec_helper'

describe Rules::TaxFormRulebook do

  describe 'F1040' do

    describe 'by default' do
      let!(:preparation) { FactoryGirl.create(:F1040_preparation) }
      specify { tax_form_exists?(preparation, 'F1040').should be_true }
    end

    describe 'should have F1040EZ' do
      let!(:preparation) { FactoryGirl.create(:F1040_preparation) }
      specify { tax_form_exists?(preparation, 'F1040EZ').should be_false }
    end
  end

  describe 'F1040EZ' do

    describe 'by default' do
      let!(:preparation) { FactoryGirl.create(:F1040EZ_preparation) }
      specify { tax_form_exists?(preparation, 'F1040EZ').should be_true }
    end

    describe 'when taxable income too high' do
      let!(:preparation) { FactoryGirl.create(:F1040EZ_preparation, taxable_income: 100000) }
      specify { tax_form_exists?(preparation, 'F1040EZ').should be_false }
    end

    describe 'when interest income too high' do
      let!(:preparation) { FactoryGirl.create(:F1040EZ_preparation, interest_income: 1500) }
      specify { tax_form_exists?(preparation, 'F1040EZ').should be_false }
    end

    describe 'when too old' do
      let!(:preparation) { FactoryGirl.create(:F1040EZ_preparation, age: 65) }
      specify { tax_form_exists?(preparation, 'F1039EZ').should be_false }
    end
  end

  private

  def tax_form_exists?(preparation, tax_form_name)
    preparation.run_form_rules
    preparation.tax_forms.collect(&:name).include?(tax_form_name)
  end
end
