Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/revenue', to: 'revenue#index'
      scope :merchants do
        get '/find', to: 'merchants_search#show'
        get '/find_all', to: 'merchants_search#index'
        get '/most_revenue', to: 'merchants_search#find_by_revenue'
        get '/most_items', to: 'merchants_search#find_by_items'
      end
      resources :merchants do
        scope module: :merchants do
          resources :items, only: :index
          resources :revenue, only: :index
        end
      end
      scope :items do
        get '/find', to: 'items_search#show'
        get '/find_all', to: 'items_search#index'
      end
      resources :items do
        scope module: :items do
          resources :merchants, only: :index
        end
      end
    end
  end
end
