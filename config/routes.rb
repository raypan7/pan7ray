Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      get 'vocabularies/index'
      post 'vocabularies/create'
      delete 'vocabularies/:id', to: 'vocabularies#destroy'
    end
  end
end
