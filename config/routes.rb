Rails.application.routes.draw do
  get 'rooms/show'
  get 'rooms/create'
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  devise_for :users


  get "search" => "searches#search"
  post 'relationships/create/:user_id', to: 'relationships#create', as:'relationships_create'
  delete 'relationships/destroy/:user_id', to: 'relationships#destroy',as:'relationships_destroy'
  


  resources :clinicals, only: [:new,:show,:index,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :clinical_comments, only: [:create,:destroy]
  end
  resources :users, only: [:index,:show,:new,:edit, :destroy, :update]
  get '/users/:user_id/clinicals', to: 'clinicals#user_index', as: :user_clinicals
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :drugs, only: [:index,:show,:new]
  resources :operations, only: [:index,:show,:new]
  resources :progresses, only: [:index,:show,:new,:destroy]
  resources :chats, only: [:create,:show,:validatee]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
