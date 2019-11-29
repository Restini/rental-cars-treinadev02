Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'  
  resources :manufacturers, only: [:index, :show, :new, :create] #acertar
  resources :subsidiaries, only: [:index, :show]

  resources :fiat_manufacturers, only: [:index, :show]
end