Rails.application.routes.draw do
  resources :mpesas
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :transactions do
      post :top_up, on: :collection
      post 'stkpush', to: 'mpesas#stkpush'
      post 'stkquery', to: 'mpesas#stkquery'
      end
      get 'reports/create'
      get 'transactions/create'
      get 'users/create'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
