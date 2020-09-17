Rails.application.routes.draw do
  devise_for :users
  root "pages#landing"
  get "welcome", to: "pages#welcome"
  get "about", to: "pages#about"
  get "auditoren", to: "users#index"
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
