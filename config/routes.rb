# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show]
    end
  end
  scope module: :web do
    root to: 'welcome#index'
    namespace :admin do
      root to: 'companies#index'
      resources :users
      resources :companies
      resources :admins
    end

    namespace :user do
      resource :profile, only: %i[edit update]
      resource :sessions, only: %i[new create destroy]
    end
  end
end
