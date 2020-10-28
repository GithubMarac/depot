Rails.application.routes.draw do
  get 'admin/index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'sessions/create'
  get 'sessions/destroy'
  resources :support_requests, only: [:index, :update]
  resources :users
  resources :orders
  resources :line_items
  root 'store#index', as: 'store_index'
  resources :carts
  resources :products do
    get :who_bought, on: :member
    put :set_quantity, on: :member
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
