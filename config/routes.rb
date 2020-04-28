# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    root to: 'companies#index'

    resources :companies
  end
end
