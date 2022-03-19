Rails.application.routes.draw do
  devise_for :customers,skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :admin do
   resources :customers, only: [:index,:show,:edit,:update]
  end
  scope module: :public do
   resources :customers, only: [:show,:edit,:update]
   get "customers/quit"=>"public#unsubscride", as: 'unsubscribe'
   patch "customers/out"=>"public#withdraw", as: 'withdraw'
  end

end
