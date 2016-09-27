Rails.application.routes.draw do

  devise_for :users
  resources :users do
    resources :profiles
    resources :hotels
  end
  root 'home#index'

end
