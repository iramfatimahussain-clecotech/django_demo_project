Rails.application.routes.draw do
  resources :likes
  get 'events/index'
  resources :comments
  resources :home
  resources :movies do
    collection do
      post :search
    end
  end
  root "inboxes#index"
  resources :inboxes
  resources :tweets
  resources :events
  
  # resources :inboxes do
  #       member do
  #         post :edit
  #      end
  #   end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
