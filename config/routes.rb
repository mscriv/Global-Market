Rails.application.routes.draw do

  resources :reviews, except: [:show, :index]

  resources :businesses
  devise_for :users, path_names: {sign_in: "signin", sign_out: "signout"}

  get 'welcome/index'

  resources :listings do
    resources :orders, only: [:new, :create]
  end

  get 'pages/about'
  get 'pages/contact'
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"

  root 'welcome#index'

end
