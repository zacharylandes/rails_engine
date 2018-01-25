Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :api do
      namespace :v1 do
        namespace :merchants do
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
          get '/:id/items' => "merchant_items#index"
          get '/most_revenue' => "merchants_by_revenue#index"
          get '/most_items' => "merchants_by_items_sold#index"
          get '/revenue' => "merchants_revenue_by_date#index"
          get '/random' => "random_controller#show"
        end
        namespace :customers do
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
          get '/:id/invoices' => "customer_invoices#index"
          get '/:id/transactions' => "customer_transactions#index"
          get '/random' => "random_controller#show"

        end
        namespace :transactions do
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
          get '/:id/invoice' => "transaction_invoice#show"
          get '/random' => "random_controller#show"

        end

        resources :merchants, only: [:index, :show]
        resources :transactions, only: [:index, :show]
        resources :customers, only: [:index, :show]
        namespace :items do
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
          get '/:id/invoice_items' => "items_invoice_items#index"
          get '/:id/merchant' => "items_merchant#show"
          get '/random' => "random_controller#show"

        end
        resources :items, only: [:index,:show]
        namespace :invoices do
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
          get '/:id/transactions' => "invoice_transactions#index"
          get '/:id/items' => "invoices_items#index"
          get '/random' => "random_controller#show"

        end
        resources :invoices, only: [:index,:show]
        namespace :invoice_items do
          get '/find' => "searches#show"
          get '/find_all' => "searches#index"
          get '/random' => "random_controller#show"

        end
        resources :invoice_items, only: [:index,:show]
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
