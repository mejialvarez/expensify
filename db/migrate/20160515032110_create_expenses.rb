class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :transaction_type, null: false
      t.date :date, null: false
      t.string :concept, null: false
      t.references :category, index: true, null: false
      t.decimal :amount, null: false

      t.timestamps null: false
    end
  end
end
