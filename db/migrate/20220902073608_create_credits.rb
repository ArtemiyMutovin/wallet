class CreateCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :credits do |t|
      t.integer :debts, default: 0
      t.boolean :active, default: true
      t.references :account, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
