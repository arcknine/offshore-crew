Rails.application.routes.draw do
  resources :films, only: [:show]
  post 'home/search'
  get 'home/index'
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
