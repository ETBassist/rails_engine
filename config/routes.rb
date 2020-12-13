Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/items/:id/merchants', to: 'items/merchants#show'
      get '/merchants/:id/items', to: 'merchants/items#index'
      get '/merchants/find', to: 'merchants_search#find_single_merchant'
      get '/merchants/find_all', to: 'merchants_search#find_plural_merchants'
      resources :merchants
      resources :items 
    end
  end
end
