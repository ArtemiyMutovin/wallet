# frozen_string_literal: true
class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
