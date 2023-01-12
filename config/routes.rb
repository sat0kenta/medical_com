Rails.application.routes.draw do
  get 'chats/create'
  get 'chats/show'
  get 'chats/validatee'
  get 'progresses/new'
  get 'progresses/show'
  get 'progresses/index'
  get 'progresses/destroy'
  get 'operations/new'
  get 'operations/show'
  get 'operations/index'
  get 'drugs/new'
  get 'drugs/show'
  get 'drugs/index'
  get 'cases/new'
  get 'cases/index'
  get 'cases/show'
  root :to =>"homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
