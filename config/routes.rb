Rails.application.routes.draw do
  api_routes = lambda do
    resource :init, only: [:show]
    resources :sessions, only: [:create, :destroy, :validate]
    resources :locations, only: [:create, :update, :index]
    resources :comments, only: [:index, :create]
    resources :activities, only: [:index] do
      collection do
        get :notifications
      end
    end
    resources :posts, only: [:create, :index, :show] do
      collection do
        get :mine
      end
    end
    resources :post_photos, only: [:create, :destroy]
    resources :post_texts, only: [:create]
    resources :spreads, only: [:create, :index] do
      collection do
        get :publishers
      end
    end
    resources :views, only: [:create]
    namespace :configuration do
      resources :locations, only: [:update]
    end
  end
  
  namespace :api do
    namespace :v1, &api_routes
    # scope :module => :v1, &api_routes
  end
end
