class AddQuestionColumnsToPreparation < ActiveRecord::Migration
  def change
    add_column :preparations, :age, :integer
    add_column :preparations, :spouse_age, :integer
    add_column :preparations, :taxable_income, :integer
    add_column :preparations, :interest_income, :integer
    add_column :preparations, :itemizing_deductions, :boolean
  end
end
