Rails.application.routes.draw do
  devise_for :users
  root 'post#index'
  resources :users, only: [:index, :edit, :update] do
    resources :posts, only: [:index, :new, :create, :edit, :show]
  end
end
