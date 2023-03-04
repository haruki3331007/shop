Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    resources :end_users
    resources :items
  end

  namespace :admin do
    resources :end_users
    resources :genres
    resources :items
  end


end
