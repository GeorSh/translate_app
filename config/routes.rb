Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "translations#translate"

  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:create, :destroy]

  get 'logout' => "user_sessions#destroy"
  
  get 'login' => 'user_sessions#new'
  get 'register' => 'users#new'

end
