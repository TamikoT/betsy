Rails.application.routes.draw do
    root 'home#index'

    resources :users, except: [:edit, :update, :destroy]
    resources :products, except: [:destroy]
    resources :category, only: [:new, :create]
    resources :reviews, except: [:edit, :update, :destroy]
    resources :orders, except: [:edit, :update, :destroy]

    get '/auth/:provider/callback', to: 'sessions#create'

    get 'login', to: 'sessions#new', as: 'login'
    post 'login', to: 'sessions#login'
    post 'logout', to: 'sessions#logout', as: 'logout'



    
end
