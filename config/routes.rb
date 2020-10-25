Rails.application.routes.draw do
  root :to => 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users ## devise_forの下に書く
  resources :books do ## devise_forの下に書く
  	resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  # resourcesをdevise_forよりも上に書くと、
  # /users/:id(.:format)が/users/sign_in(.:format)より優先度が高いため
  # urlからsign_inを入力してもidにsign_inが代入されるためエラーが表示される
end
