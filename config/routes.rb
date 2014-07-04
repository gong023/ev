require 'sidekiq/web'

Lifelog::Application.routes.draw do
  root to: 'welcome#index'

  get '/welcome' => 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'

  resources :users, only: [:edit, :update]
  post '/workers/:id' => 'workers#create'

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['EVERLOG_QUEUE_USERNAME'] && password == ENV['EVERLOG_QUEUE_PASSWORD']
  end
  mount Sidekiq::Web => '/admin/queue'
end
