class CreatePreparations < ActiveRecord::Migration
  def change
    create_table :preparations do |t|
      t.integer :year

      t.timestamps
    end
  end
end
