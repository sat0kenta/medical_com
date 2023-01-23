Rails.application.routes.draw do


  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  devise_for :users

  resources :clinicals, only: [:new,:show,:index,:edit,:create,:destroy,:update] do
  end
  resources :users, only: [:index,:show,:new,:edit, :destroy, :update]
  resources :drugs, only: [:index,:show,:new]
  resources :operations, only: [:index,:show,:new]
  resources :progresses, only: [:index,:show,:new,:destroy]
  resources :chats, only: [:create,:show,:validatee]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
