Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    resources :end_users do
      resources :cart_items
      resources :address
      resources :orders
      resources :order_items
    end
    
    resources :items
    
  end

  namespace :admin do
    resources :end_users do
      resources :orders
    end
    resources :genres
    resources :items
    resources :order_items

  end


end
