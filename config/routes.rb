Rails.application.routes.draw do
    root 'home#index'

    resources :users, except: [:edit, :update, :destroy]
    resources :products, except: [:destroy] do
      resources :reviews, only: [:new, :create, :new]
    end
    resources :reviews, only: [:show, :edit, :update, :destroy]

    resources :category, only: [:new, :create] do
        get '/products', to: 'products#index'
    end

    resources :orders, except: [:edit, :update, :destroy]

    get '/auth/:provider/callback', to: 'sessions#create'

    get 'login', to: 'sessions#new', as: 'login'
    post 'login', to: 'sessions#login'
    post 'logout', to: 'sessions#logout', as: 'logout'





end
