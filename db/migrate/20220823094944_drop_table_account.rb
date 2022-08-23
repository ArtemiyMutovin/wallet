class DropTableAccount < ActiveRecord::Migration[7.0]
  def change
    drop_table :accounts, if_exists: true
  end
end
