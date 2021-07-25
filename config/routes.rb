Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  get '/logout' => "sessions#destroy"
  delete '/logout' => "sessions#destroy"

  # get '/attractions/new' => "attractions#new"
  # get '/attractions/:id/edit' => "attractions#edit"
  # patch '/attractions/:id' => "attractions#update"
  # post '/attractions/new' => "attractions#create"

  # post '/rides' => "rides#create"

  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:new, :create, :show]
  resources :rides, only: :create
end
