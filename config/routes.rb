Rails.application.routes.draw do
  root 'supplies#index'

  devise_for :users

  get 'supply/thanks' => 'histories#thank'
  get 'supply/receipt' => 'histories#receipt'

  resources :users do
    resources :addresses
  end



  resources :supplies, only: [:new, :destroy, :update, :edit, :create, :show] do
    resources :comments
    resources :histories
    resources :likes, only: [:create, :destroy]
  end

  get 'users/:user_id/likes' => 'likes#index',as: 'likes'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
