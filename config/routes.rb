Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :edit, :update] do
    resources :posts, only: [:index, :edit, :show]
  end
end
