Rails.application.routes.draw do
  # get 'sessions/new'
  # namespace :admin do
  #   get 'users/new'
  #   get 'users/edit'
  #   get 'users/show'
  #   get 'users/index'
  # end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # 管理者用ユーザ登録
  namespace :admin do
    resources :users
  end
  # タスクの一覧画面をルートに設定
  root to: 'tasks#index'
  # tasksの全てのアクション(index, show, new, create, edit, update, destroy)を作成
  resources :tasks do
    # 確認用を追加
    post :confirm, action: :confirm_new, on: :new
    # CSV入力を追加
    post :import, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
