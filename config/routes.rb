Rails.application.routes.draw do
  get 'admin/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  #routing to provider authentication page
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  

  resources :users do
    resource :topics
  end
  
  resource :sessions

  resources :sources do
    collection do
      get 'refresh', to: 'sources#import_sources', as: 'refresh'
    end
  end

  resources :countries

  resources :languages
  
  resources :categories

end
