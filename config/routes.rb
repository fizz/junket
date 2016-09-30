Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resource :profile
    resources :hotels
  end

  root 'home#index'
end
