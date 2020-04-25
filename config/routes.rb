# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :user do
    resources :users
  end

  resources :sessions, only: %i[new create destroy]
end
