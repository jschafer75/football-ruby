Rails.application.routes.draw do
  get 'football', to: 'franchises#index'
  
  resources :franchises do
    resources :players do
      member do
        get 'sign'
      end
    end
    resources :coaches do
      member do
        get 'sign'
      end
    end
  end
end
