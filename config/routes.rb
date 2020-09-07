Rails.application.routes.draw do
  devise_for :users
  root to: 'franchises#index'

  resources :schedules
  get 'football', to: 'franchises#index'
  
  resources :leagues do
    member do
      post 'generate_schedule'
    end
  end
  
  resources :franchises do
    resources :people do
      member do
        get 'sign'
        get 'release'
      end
      collection do
        post 'generate_random'
        get 'available'
      end
    end
    resources :stadia do
      collection do
        post 'build_stadium'
      end
    end
    resources :facilities
    member do
      post 'fill_team'
      get 'roster'
      get 'setup_game'
      post 'play_game'
      get 'schedule'
      post 'set_user'
    end
  end
end
