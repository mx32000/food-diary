# represents a food eaten by a specific user at a specific time, with an amount attached
class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.references :food, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :quantity, default: 1
      t.datetime :consumed_at

      t.timestamps
    end
  end
end
