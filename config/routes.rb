Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :api do
      namespace :v1 do 
        resources :merchants, only: [:index, :show]
        resources :transactions, only: [:index, :show]
        resources :customers, only: [:index, :show]
        resources :items, except: [:edit, :new]
        resources :invoices, except: [:edit, :new]
        resources :invoice_items, except: [:edit, :new]
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
