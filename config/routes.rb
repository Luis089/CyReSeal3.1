Rails.application.routes.draw do
  devise_scope :user do
    post "users/sign_up", to: "devise/registrations#create"
  end
  devise_for :users
  resources :partakers
  resources :quizzes
  resources :questions 
  resources :answers 
  resources :results 
  root "pages#landing"
  get "welcome", to: "pages#welcome"
  get "about", to: "pages#about"
  get "quizzes", to: "quizzes#index"
  get "users", to: "users#index"
  get '/users/:id', to: 'users#show', as: 'user'
end
