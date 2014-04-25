class TaxForm < ActiveRecord::Base

  belongs_to :preparation

  def self.add_to_preparation options
    if options[:preparation_id] && options[:name]
      preparation = Preparation.find_by_id options[:preparation_id]
      unless preparation.tax_forms.exists?(name: options[:name])
        return preparation.tax_forms.create name: options[:name]
      end
    end
    return true
  end
end
