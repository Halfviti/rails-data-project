Rails.application.routes.draw do
  get 'planets/index'
  get 'planets/show'
  resources :characters, only: [:index, :show]
  resources :planets, only: [:index, :show]
  resources :welcome, only: [:index]

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
