# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :sessions, only: %i[new create destroy]
    root to: 'companies#index'
    resources :companies
  end
end
