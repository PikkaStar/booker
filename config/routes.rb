Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get root to: 'homes#top'
  get '/home/about'=>'homes#about',as: "about"
  resources :books do
    resource :favorites,only: [:create,:destroy]
    resources :book_comments,only: [:create,:destroy]
  end
  devise_for :users
   resources :users,only: [:index,:show,:edit,:update]do
     resource :relationships,only: [:create,:destroy]
     get 'followings'=>'relationships#followings',as: 'followings'
     get 'followers'=>'relationships#followers',as: 'followers'
   end
end
