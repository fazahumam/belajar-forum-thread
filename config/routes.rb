Rails.application.routes.draw do
  get 'forum_posts/new'
  devise_for :users

  root 'forum_threads#index'

  resources :forum_threads, only: [:show, :new, :create, :edit, :update, :destroy] do
    put :pinit, on: :member
    resources :forum_posts, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
