Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'

  resources :microposts
  resources :users
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  # root 'application#hello'
  root 'user#index'
end
