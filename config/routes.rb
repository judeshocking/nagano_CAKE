Rails.application.routes.draw do

  #顧客用
  #URL/customers/sign_in ...
devise_for :customers,skip:[:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip:[:registrations, :passwords], controllers: {
  sessions: "admin/sessions",
  passwords: 'admin/passwords',
  registrations: 'admin/registrations'
}

#admin
  namespace :admin do
    resources :orders, only:[:show,:update]
    root 'homes#top'
    resources :customers, only:[:index,:edit,:show,:update]
    resources :genres, only:[:index,:edit,:create,:update]
    resources :items, only: [:index, :create, :new, :show, :edit, :update]
    resources :order_items, only: [:update]
  end


  scope module: :public do
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
    get "/orders/compleate" => "orders#compleate"
    post "/orders/confirm" => "orders#confirm"
    resources :orders, only:[:new,:index,:show,:create]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only:[:index,:update,:destroy,:create]
    get "/customer/:id/quit" => "customers#quit", as: "quit"
    patch "/customers/:id/out" => "customers#out", as: "out"
    resources :customers, only:[:show,:edit,:update]
    resources :items, only:[:index,:show]
    root "homes#top"
    get "/about" => "homes#about"
    get "/thanks" => "homes#thanks"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
