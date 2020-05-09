Rails.application.routes.draw do
  get 'football', to: 'franchises#index'
  
  resources :franchises
  resources :players
  resources :coaches
end
