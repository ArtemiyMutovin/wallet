# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @credits = current_user.credits
  end

end
