Rails.application.routes.draw do
scope module: 'public' do
  root "items#top"
    resource :end_users,only:[:edit,:update]
    get "end_users/about" =>"end_users#about" ,as: "about"
    get "end_users/confirm" => "end_users#confirm",as: "confirm"
    patch "end_users/withdraw" => "end_users#withdraw",as: "withdraw"
    put "end_users/withdraw" => "end_users#withdraw"
    delete "cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all"
 resources :items,only: [:index,:show]
    get  "orders/thank"=> "orders#thank",as: "thank"
    get "orders/confirm" => "orders#error"
    post "orders/confirm"=> "orders#confirm",as: "order_confirm"
 resources :orders ,only:[:create,:new,:index,:show]
 resources :addresses ,only: [:index,:show,:edit,:create,:update]
 resources :cart_items,only: [:index,:create,:update,:destory]
 resources :genres,only: [:show]
end
 devise_for :end_users ,controllers: {
    sessions: "public/sessions",
    registrations: 'public/registrations',
    password: "public/passwords",
  }
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
 namespace :admin do
  get 'top' => "homes"
  resources :end_users,only: [:index]
  resources :genres,only: [:index,:edit,:create,:update]
  resources :items
  resources :orders
  resources :order_details ,only: [:update]
    patch "orders_details/all_up", to: "order_details#all_up",as: "all_up"
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


