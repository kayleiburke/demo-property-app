Rails.application.routes.draw do
  resources :accounts
  get "/pages/:page" => "pages#show"

  devise_for :users, skip: [:sessions]
  as :user do
    get 'sign_in', to: 'pages#main', as: :new_user_session
    post 'sign_in', to: 'devise/sessions#create', as: :user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root to: "pages#main"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
