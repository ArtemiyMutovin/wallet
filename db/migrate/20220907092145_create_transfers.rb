class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.integer :amount
      t.string :cipher
      t.references :sender, foreign_key: { to_table: :users }, index: true, null: false
      t.references :receiver, foreign_key: { to_table: :users }, index: true, null: false

      t.timestamps
    end
  end
end
