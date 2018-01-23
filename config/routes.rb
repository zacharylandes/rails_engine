Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :items, except: [:edit, :new]
      resources :invoices, except: [:edit, :new]
      resources :invoice_items, except: [:edit, :new]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
