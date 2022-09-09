class CreditsController < ApplicationController
  before_action :authenticate_user!

  def new
    @credit = account.credits.new
  end

  def create
    @credit = account.credits.new(credit_params)
    @credit.user = current_user

    if @credit.save
      account.increase_balance(@credit.debts)
      render :'credits/show'
    else
      render :new
    end
  end

  private

  def account
    @account ||= current_user.account
  end

  def credit_params
    params.require(:credit).permit(:debts, :active, :account_id, :user_id)
  end
end
