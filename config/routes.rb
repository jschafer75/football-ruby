Rails.application.routes.draw do
  get 'football', to: 'franchises#index'
  
  resources :franchises do
    resources :players
    resources :coaches
  end
end
