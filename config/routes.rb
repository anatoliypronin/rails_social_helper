Rails.application.routes.draw do
  namespace :admin do
    resources :companies
  end
end
