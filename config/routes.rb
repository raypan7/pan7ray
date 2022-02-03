Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/vue_test', to: 'welcome#vue_test'

  resources :vocabularies
  resources :vocabulary_groups
end
