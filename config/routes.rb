Rails.application.routes.draw do

  devise_for :users
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
