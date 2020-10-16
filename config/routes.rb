Rails.application.routes.draw do
  resources :roles
  resources :quizzes
  resources :questions 
  resources :answers 
  resources :results 
  devise_for :users
  devise_scope :user do
    post "users/sign_up", to: "devise/registrations#create"
  end
  root "pages#landing"
  get "welcome", to: "pages#welcome"
  get "about", to: "pages#about"
  get "auditoren", to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
