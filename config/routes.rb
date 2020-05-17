Rails.application.routes.draw do
  get 'football', to: 'franchises#index'
  
  resources :franchises do
    resources :people do
      member do
        get 'sign'
        get 'release'
      end
    end
  end
end
