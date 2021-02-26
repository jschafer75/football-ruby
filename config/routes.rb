Rails.application.routes.draw do
  devise_for :users
  root to: 'franchises#index'

  get 'football', to: 'franchises#index'
  
  resources :leagues do
    member do
      post 'generate_schedule'
      get 'schedule'
      post 'play_week'
      post 'advance_week'
      post 'new_season'
    end
  end

  resources :games do
    member do
      post 'play'
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
      member do
        post 'upgrade'
      end
      collection do
        post 'build_stadium'
      end
    end
    resources :facilities do
      member do
        post 'upgrade'
      end
    end
    collection do
      post 'start'
    end
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
