Rails.application.routes.draw do
  # Shopr admin interface
  #
  mount Shopr::Engine => '/shopr'

  Shopr::Engine.routes.draw do
    # Else

    resources :products do
      resources :comments
      resources :variants
      collection do
        get :import
        post :import
      end
    end
  end

  #
  # Product browising
  #
  get 'products' => 'products#categories', :as => 'catalogue'
  get 'products/filter' => 'products#filter', :as => 'product_filter'
  get 'products/:category_id' => 'products#index', :as => 'products'
  get 'products/:category_id/:product_id' => 'products#show', :as => 'product'
  get 'products/:category_id/:product_id/change_variant' => 'products#change_variant', as: 'change_variant'
  post 'products/:category_id/:product_id/buy' => 'products#add_to_basket', :as => 'buy_product'

  resources :products do
    resources :comments
  end

  #
  # Order status
  #
  get 'order/:token' => 'orders#status', :as => 'order_status'

  #
  # Basket
  #
  get 'basket' => 'orders#show', :as => 'basket'
  delete 'basket' => 'orders#destroy', :as => 'empty_basket'
  post 'basket/:order_item_id' => 'orders#change_item_quantity', :as => 'adjust_basket_item_quantity'
  delete 'basket/:order_item_id' => 'orders#change_item_quantity'
  delete 'basket/delete/:order_item_id' => 'orders#remove_item', :as => 'remove_basket_item'

  #
  # Checkout
  #
  match 'checkout' => 'orders#checkout', :as => 'checkout', :via => [:get, :patch]
  match 'checkout/delivery' => 'orders#change_delivery_service', :as => 'change_delivery_service', :via => [:post]
  match 'checkout/pay' => 'orders#payment', :as => 'checkout_payment', :via => [:get, :patch]
  match 'checkout/confirm' => 'orders#confirmation', :as => 'checkout_confirmation', :via => [:get, :patch]

  #
  # Static pages
  #
  get ':action', controller: 'pages', as: 'page'

  #
  # Homepage
  #
  root 'pages#home'

  # Tempo fix admin area redirection

  get '/users/sign_in', to: redirect('/shopr/users/sign_in')
end
