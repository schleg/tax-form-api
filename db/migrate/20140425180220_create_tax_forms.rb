class CreateTaxForms < ActiveRecord::Migration
  def change
    create_table :tax_forms do |t|
      t.integer :preparation_id
      t.string :name

      t.timestamps
    end
  end
end
