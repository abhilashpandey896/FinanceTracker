Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
 devise_scope :user do
  get "users/sign_out" => "devise/sessions#destroy"
end
   root "welcome#index"
   get 'my_portfolio', to: "users#my_portfolio"
   get 'search_stock', to: 'stocks#search'
   resources :user_stocks, only: [:create, :destroy]
   get "my_friends", to: "users#my_friends"
end
