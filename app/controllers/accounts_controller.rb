# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @credits = current_user.credits
    @transfers = current_user.transfers
  end
end
