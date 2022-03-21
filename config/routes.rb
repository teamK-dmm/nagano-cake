Rails.application.routes.draw do
    root to: "public/homes#top"
    get "/about" => "public/homes#about", as: "about"

    get "customers/edit"=>"public/customers#edit", as: "customer_edit"
  devise_for :customers,skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :items, only: [:index, :show, :edit, :update, :create, :new]
  end

  namespace :admin do
   resources :customers, only: [:index,:show,:edit,:update]
  end
  scope module: :public do
   get "customers/unsubscribe"=>"customers#unsubscribe", as: 'unsubscribe'
   patch "customers/withdraw"=>"customers#withdraw", as: 'withdraw'
   resources :customers, only: [:show,:update]
  end
  
  resources :cart_item, only: [:index, :show, :create, :update, :destroy]
end
