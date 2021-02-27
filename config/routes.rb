Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  root to: "prototypes#index"
  resources :users, only: [:show ]
  resources :prototypes, only: [:index, :create, :new, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create ]
  end
  #ネストを作成
  #indexアクションは必要とされていないが、記述してみた。
end
