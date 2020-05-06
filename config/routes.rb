Rails.application.routes.draw do

	devise_for :end_users, controllers: {
        sessions: 'public/sessions',
        registrations: 'public/registrations'
      }

  devise_for :admin, controllers:{
        sessions: 'admin/sessions',
        registrations: 'admin/registrations'
  }


  namespace :public do
  end

  namespace :admin do
  end

  root to: 'public/items#top'
  get '/admin/top' => 'admin/top#top'
  get 'end_users/mypage' => 'public/end_users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
