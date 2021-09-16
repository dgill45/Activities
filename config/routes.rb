Rails.application.routes.draw do
  resources :activities, only: [:index, :show]
  resources :users, only: [:index, :show, :create, :update, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
