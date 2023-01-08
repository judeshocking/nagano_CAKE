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
    root 'homes#top'
    resources :customers, only:[:index,:edit,:show,:update]
    resources :genres, only:[:index,:edit,:create,:update]
    resources :items, except:[:destroy]

  end


  namespace :public do
    root 'homes#top'
    resources :addresses, only:[:index,:edit,:create,:update,:destory]
    resources :orders, only:[:new,:confirm,:compleate,:index,:show,:create]
    resources :cart_items, only:[:index,:update,:destory,:destroy_all,:create]
    resources :customers, only:[:show,:edit,:update,:quit,:out]
    resources :items, only:[:index,:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
