Rails.application.routes.draw do
   devise_scope :user do
    post "users/sign_up", to: "devise/registrations#create"
  end
  resources :attempts
  resources :quizzes
  resources :questions 
  resources :answers 
  resources :results 
  devise_for :users , controllers: { registrations: 'registrations' }
  root "pages#landing"
  get "about", to: "pages#about"
  get "quizzes", to: "quizzes#index"
  get "users", to: "users#index"
  get '/users/:id', to: 'users#show', as: 'user'
  delete "/users/:id", to:  'users#destroy', as: 'delete_user'
end
