Rails.application.routes.draw do
  get 'home/index'
  root 'supplies#index'
  patch 'histories/:id/receipt_status' => 'histories#receipt_status', as: 'status'

  devise_for :users

  get 'supply/thanks' => 'histories#thank'
  get 'users/:id/receipt' => 'histories#receipt', as:'supply_receipt'

  resources :users do
    resources :addresses
  end

  post 'users/:user_id/lists' => 'lists#create', as: 'lists_create'
  get 'users/:user_id/lists' => 'lists#index', as: 'lists'
  delete 'users/:user_id/lists/:id' => 'lists#destroy', as: 'lists_destroy'



  resources :supplies, only: [:new, :destroy, :update, :edit, :create, :show] do
    resources :comments
    resources :histories
    resources :likes, only: [:create, :destroy]
  end

  get 'histories/:hisotories_id/label' => 'histories#label', as: 'label'

  get 'users/:user_id/likes' => 'likes#index',as: 'likes'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
