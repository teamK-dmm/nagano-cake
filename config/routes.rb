Rails.application.routes.draw do

    # Top
    root to: "public/homes#top"
    get "/about" => "public/homes#about", as: "about"

    #customer/edit
    get "customers/edit"=>"public/customers#edit", as: "customer_edit"

    #devise
    devise_for :customers,skip:[:passwords], controllers: {registrations: "public/registrations",sessions: 'public/sessions'}
    devise_for :admin,skip:[:registrations, :passwords], controllers: {sessions: "admin/sessions"}

    # genre
    resources :genres

    # public
    namespace :public do
     get "orders/thanks"=>"orders#thanks"
     resources :items, only:[:index, :show]
     resources :orders, only:[:new, :index, :show, :create]
     post "orders/log"=>"orders#log"
    end

    #admin
    namespace :admin do
     resources :items, only: [:index, :show, :edit, :update, :create, :new]
     resources :customers, only: [:index,:show,:edit,:update]
    end

    #public
    scope module: :public do
      get "customers/unsubscribe"=>"customers#unsubscribe", as: 'unsubscribe'
      patch "customers/withdraw"=>"customers#withdraw", as: 'withdraw'
      delete "cart_items/all_destroy" => "cart_items#all_destroy", as: "all_destroy"
      resources :customers, only: [:show,:update]
      resources :addresses, only: [:index, :create, :destroy, :edit, :update]
      resources :cart_items, only: [:index, :show, :create, :update, :destroy]
    end
end
