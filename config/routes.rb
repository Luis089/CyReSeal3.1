Rails.application.routes.draw do
  devise_scope :user do
    post "users/sign_up", to: "devise/registrations#create"
  end
  devise_for :users
  resources :roles
  resources :quizzes
  resources :questions 
  resources :answers 
  resources :results 
  root "pages#landing"
  get "welcome", to: "pages#welcome"
  get "about", to: "pages#about"
  get "auditoren", to: "users#index"
end
