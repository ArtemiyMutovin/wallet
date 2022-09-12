class TransfersController < ApplicationController
  before_action :authenticate_user!

  def new
    @transfer = current_user.sender_transfers.new
  end

  def create
    result = transfer_create_service

    if result.errors.empty? && result.transfer.present?
      render :'transfers/show'
    else
      flash[:notice] = result.errors
      redirect_to new_transfer_path
    end
  end

  private

  def transfer_create_service
    Transfer::CreateService.new(
      amount: params[:transfer][:amount],
      account_number: params[:transfer][:cipher],
      sender_account: current_user.account
    ).call
  end

  def transfer_params
    params.require(:transfer).permit(:amount, :cipher)
  end
end
