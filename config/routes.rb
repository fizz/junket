Rails.application.routes.draw do

  devise_for :users

  resources :users, shallow: true do
    resource :profile
    resources :hotels
  end

  resources :hotels, only: :index
  resource :profile, only: :show

  root 'home#index'
end
