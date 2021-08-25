Rails.application.routes.draw do

	devise_for :end_users, controllers: {
        sessions: 'public/sessions',
        registrations: 'public/registrations'
      }

  devise_for :admin, controllers:{
        sessions: 'admin/sessions',
        registrations: 'admin/registrations'
  }


  scope module: :public do
   get 'end_users/mypage' => 'end_users#show'
   get 'end_users/mypage/edit' => 'end_users#edit'
   patch 'end_users/mypage' => 'end_users#update'
   get 'end_users/confirm' => 'end_users#confirm'
   put "/end_users/confirm" => "end_users#withdraw"
   resources :items,only:[:index,:show]
   delete "/cart_items/destroy_all" => 'cart_items#destroy_all'
   resources :cart_items, only:[:index, :update, :destroy,:create]
   post "orders/confirm" => "orders#confirm"
   get "orders/complete" => "orders#complete"
   resources :orders, only:[:new, :create, :index, :show]
   resources :addresses, only:[:index, :edit, :create, :update, :destroy]
   resources :genres, only:[:show]


  end

  namespace :admin do
    resources :end_users
    get '/top' => 'top#top'
    resources :genres, only:[:new,:index,:create,:edit,:update]
    resources :items
    resources :orders, only:[:index,:show,:update]
    resources :order_details, only:[:update]
  end

  root to: 'public/items#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
