Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'links#index'
  resources :links, only: [:index, :create, :destroy]
  get '/links/:short_url', to: 'links#show', as: :show_short_url
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :links, only: [ :index, :show ]
    end
  end
end
