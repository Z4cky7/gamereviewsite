Rails.application.routes.draw do
  root to: 'homes#top'
  get 'new/index'
  get 'new/show'
  devise_for :users
  
  get '/homes/about' => 'homes#about',as:'about'
  get 'lists/new'
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  get 'lists/:id' => 'lists#show', as:'list'
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  patch 'lists/:id' => 'lists#update', as: 'update_list'
  delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'
  resources :users, only: [:show, :edit]
  resources :post_images, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
