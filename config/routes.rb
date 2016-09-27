Rails.application.routes.draw do

  devise_for :users
  resources :users, param: :token do
    resources :profiles
  end
  root 'home#index'

end
