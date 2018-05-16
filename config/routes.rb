Rails.application.routes.draw do
  root 'top#index'
  get 'rooms', to: 'rooms#show', as: 'room'
  get 'kakoi_rooms', to: 'kakoirooms#show', as: 'kakoi_room'
  resources :messages, only: [:new, :create, :destroy]
end
