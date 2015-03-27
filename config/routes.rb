Rails.application.routes.draw do
  api_routes = lambda do
    resource :init, only: [:show]
    resources :sessions, only: [:create] do
      collection do
        get :current
      end
      collection do
        delete :destroy
      end
    end
    resources :locations, only: [:create, :update, :index]
    resources :comments, only: [:index, :create]
    resources :votes, only: [:create, :destroy]
    resources :activities, only: [:index] do
      collection do
        get :notifications
        get :unread_notifications_count
        put :mark_all_as_read
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
