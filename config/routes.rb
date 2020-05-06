Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :franchises
  resources :players
  resources :coaches
end
