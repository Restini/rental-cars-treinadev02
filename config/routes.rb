Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'  
  resources :manufectures, only: [:index, :show] 
  resources :fiat_manufecturers, only: [:index, :show]
  resources :subsidiaries, only: [:index, :show]
end