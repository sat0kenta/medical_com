Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :users, only: [:index, :show, :update]
    resources :clinical_comments, only: [:destroy, :index]
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root :to =>"homes#top"
    
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  devise_scope :user do
   post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  
 
  get 'rooms/show'
  get 'rooms/create'
  get "home/about"=>"homes#about"


  get "search" => "searches#search"
  post 'relationships/create/:user_id', to: 'relationships#create', as:'relationships_create'
  delete 'relationships/destroy/:user_id', to: 'relationships#destroy',as:'relationships_destroy'
  


  resources :clinicals, only: [:new,:show,:index,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :clinical_comments, only: [:create,:destroy]
  end
  resources :users, only: [:index,:show,:new,:edit, :destroy, :update] do
     member do
      get :favorites
    end
  end
  get '/users/:user_id/clinicals', to: 'clinicals#user_index', as: :user_clinicals
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :drugs, only: [:index,:show,:new]
  resources :operations, only: [:index,:show,:new]
  resources :progresses, only: [:index,:show,:new,:destroy]
  resources :chats, only: [:create,:show,:validatee]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
