Rails.application.routes.draw do
  resources :accounts
  get "/pages/:page" => "pages#show"

  devise_for :users
  root to: "pages#main"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
