Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :api do
      namespace :v1 do
        namespace :merchants do
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
          get '/:id/items' => "merchant_items#index"
          get '/most_revenue' => "merchants_by_revenue#index"
        end
        namespace :customers do 
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
        end
        namespace :transactions do 
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
        end
        resources :merchants, only: [:index, :show] 
        resources :transactions, only: [:index, :show]
        resources :customers, only: [:index, :show]
        namespace :items do
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
        end
        resources :items, only: [:index,:show]
        namespace :invoices do
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
          get '/:id/transactions' => "invoice_transactions#index"
          get '/:id/items' => "invoices_items#index"
        end
        resources :invoices, only: [:index,:show]
        namespace :invoice_items do
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
        end
        resources :invoice_items, only: [:index,:show]
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
