Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/items/:id/merchants', to: 'items/merchants#show'
      get '/items/find', to: 'items_search#find_single_item'
      get '/items/find_all', to: 'items_search#find_plural_items'
      get '/merchants/:id/items', to: 'merchants/items#index'
      get '/merchants/find', to: 'merchants_search#find_single_merchant'
      get '/merchants/find_all', to: 'merchants_search#find_plural_merchants'
      get '/merchants/most_revenue', to: 'merchants_search#find_by_revenue'
      get '/merchants/:id/revenue', to: 'merchants#revenue'
      get '/revenue', to: 'revenue#revenue_in_range'
      resources :merchants
      resources :items 
    end
  end
end
