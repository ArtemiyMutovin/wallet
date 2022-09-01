# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show; end
end
