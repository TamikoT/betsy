Rails.application.routes.draw do
    root 'home#index'

    resources :users, except: [:edit, :update, :destroy]
    resources :orders, except: [:edit, :update, :destroy]
    resources :reviews, only: [:show, :edit, :update, :destroy]

    resources :products, except: [:destroy] do
        resources :reviews, only: [:new, :create, :new]
    end


    resources :categories, only: [:new, :create, :show] do
        get '/products', to: 'products#index'
    end

    post '/products/:id/addcategory', to: 'products#add_category', as: 'add_category'
    get '/auth/:provider/callback', to: 'sessions#create'



    get 'login', to: 'sessions#new', as: 'login'
    post 'login', to: 'sessions#login'
    post 'logout', to: 'sessions#logout', as: 'logout'

    post 'products/:id/cart', to: 'orders#add_product', as: 'add_to_cart'
end
