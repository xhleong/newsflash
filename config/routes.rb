Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    resource :topics
  end
  
  resource :sessions

  root 'home#index'

    #routing to provider authentication page
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


end
