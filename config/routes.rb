Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: "homes#top", as: "top"

    patch 'categories/:id' => 'categories#update', as: 'update_category'
    resources :categories, only: [:index, :create, :edit, :destroy]
    
    patch 'users/:id' => 'users#update', as: 'update_user'
    resources :users, only: [:index, :show, :edit]

    resources :post_comments, only: [:index, :destroy]

    resources :posts, only: [:index, :show]
  end

  scope module: :public do
    root to: "homes#top"
    
    post 'guests/guest_sign_in' => 'guests#new_guest'

    get 'users/mypage' => 'users#show', as: 'mypage'
    get 'user/profile/edit' => 'users#edit', as: 'edit_profile'
    patch 'users/:id' => 'users#update', as: 'update_user'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    put 'users/withdraw' => 'users#withdraw'

    get 'search' => 'posts#search'
    patch 'posts/:id' => 'posts#update', as: 'update_post'
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    
    resources :favorites, only: [:index]
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
