Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups do
    member do
      post :join
      post :leave
    end
    resources :posts do
      resources :comments
    end
  end

  namespace :account do
    resources :groups
    resources :posts
  end

  root 'groups#index'
end
