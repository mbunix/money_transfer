Rails.application.routes.draw do
  get 'signin/new'
  get 'signin/create'
  get 'signin/destroy'
 
  resources :mpesas
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :transactions do
      resources :transactions, only: [:index, :new, :create,:top_up]
      resources :report, only: [:new, :create]
      post :top_up, on: :collection
      post 'transactions/top_up', to: 'transactions#top_up'
      post 'stkpush', to: 'mpesas#stkpush'
      post 'stkquery', to: 'mpesas#stkquery'
      end
      get 'reports/create'
      get 'transactions/create'
      get 'users/create'
      get '/signin', to: 'signin#new'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
