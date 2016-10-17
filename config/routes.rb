Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users do
    resources :stocks
    resources :products do
    end
    resources :customers do
      member do
        get 'send_stock_update' => 'customers#send_stock_update'
      end
    end
  end
end
