Lifelog::Application.routes.draw do
  root to: 'welcome#index'

  get '/welcome' => 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'

  resources :users, only: [:edit, :update]
  post '/workers/' => 'workers#create'
end
