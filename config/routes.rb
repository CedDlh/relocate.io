Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :buddies do
    resources :appointments, only: [:create, :edit, :delete]
  end

  # arbi's fakeroute to pages#search
  get "/search", to: "pages#search"
end
