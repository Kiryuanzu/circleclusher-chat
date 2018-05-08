Rails.application.routes.draw do
  root 'top#index'
  get 'rooms', to: 'rooms#show', as: 'room'
  resources :messages, only: [:new, :create, :destroy]
end
