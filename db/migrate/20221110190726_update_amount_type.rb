class UpdateAmountType < ActiveRecord::Migration[7.0]
  def change
    change_column(:accounts, :balance, :decimal)
    change_column(:transfers, :amount, :decimal)
    change_column(:credits, :debts, :decimal)
  end
end
