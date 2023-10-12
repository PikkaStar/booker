Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get root to: 'homes#top'
  get '/home/about'=>'homes#about',as: "about"
  resources :books
  devise_for :users
   resources :users,only: [:index,:show,:edit,:update]
end
