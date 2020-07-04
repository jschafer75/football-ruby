Rails.application.routes.draw do
  get 'football', to: 'franchises#index'
  
  resources :leagues
  
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
    member do
      post 'generate_team'
      get 'setup_game'
      post 'play_game'
      get 'roster'
    end
  end
end
