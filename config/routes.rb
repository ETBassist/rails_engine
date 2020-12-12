Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :merchants
      resources :items 
      get '/items/:id/merchants', to: 'items/merchants#show'
    end
  end
end
