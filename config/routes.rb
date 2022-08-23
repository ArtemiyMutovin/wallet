# frozen_string_literal: true

Rails.application.routes.draw do

  Rails.application.routes.default_url_options[:host] = 'XXX'

  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  root to: 'accounts#index'
end
