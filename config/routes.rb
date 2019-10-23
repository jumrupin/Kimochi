Rails.application.routes.draw do
  devise_for :users

  get 'supply/thanks' => 'histories#thank'
  get 'supply/receipt' => 'histories#receipt'

  resources :users do
    resources :addresses
  end



  resources :supplies do
    resources :comments
    resources :histories
    resources :likes, only: [:create, :destroy, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
