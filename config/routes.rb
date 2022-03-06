Rails.application.routes.draw do

  devise_for :users

  resources :users

  resources :posts do
    resources :comments do
      member do
        get :highlight
        get :remove_highlight
      end
    end
  end

  resource :cart do
    collection do
      post :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    root 'posts#index'
    resources :posts
  end

  root 'posts#index'
end
