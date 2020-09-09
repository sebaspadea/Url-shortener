Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'links#index'
  resources :links, only: [:index, :new, :create, :delete]
end
