Lifelog::Application.routes.draw do
  root to: 'welcome#index'
  resources :users
  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'
end
