Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'appointments/index'
  # get 'appointments/create'
  # get 'appointments/update'
  # get 'appointments/delte'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buddies do
    resources :requests, only: [:create, :edit, :update]
    resources :appointments, only: [:create, :edit, :delete]
  end

  # arbi's fakeroute to pages#search
  get "/search", to: "pages#search"
  get '/my_requests', to: "buddies#my_requests"
end
