require 'sidekiq/web'

Lifelog::Application.routes.draw do
  root to: 'welcome#index'

  get '/welcome' => 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'

  resources :users, only: [:edit, :update]
  post '/workers/:id' => 'workers#create'

  # 別にこのサーバー上でやらなくてもいいんだ
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'lifelogsidekiq' && password == 'bakasinegenkika'
  end
  mount Sidekiq::Web => '/admin/queue'
end
