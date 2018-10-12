Rails.application.routes.draw do
  resources :characters, only: [:index, :show]
  resources :planets, only: [:index, :show]
  resources :films, only: [:index, :show]
  resources :species, only: [:index, :show]
  resources :welcome, only: [:index]

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
