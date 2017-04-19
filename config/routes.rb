Rails.application.routes.draw do
    root 'home#index'

    resources :users, except: [:edit, :update, :destroy]
    resources :products, except: [:destroy]
    resources :category, only: [:new, :create]
    resources :reviews, except: [:edit, :update, :destroy]
    resources :orders, except: [:edit, :update, :destroy]

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get '/auth/:provider/callback', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
end
