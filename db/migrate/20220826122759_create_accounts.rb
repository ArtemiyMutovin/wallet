class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :number
      t.integer :balance, default: 0
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
