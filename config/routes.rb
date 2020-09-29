Rails.application.routes.draw do
  get 'welcome/index'  # reference to controller Welcome, action index 
  post 'articles/new',to:'articles#create'
  post 'articles',to:'articles#index'
  get 'articles/new'
  get 'articles/show',to:'articles#show',as: :articlesShow
  get 'articles/index',to:'articles#index',as: :articleIndex
  get 'articles/index:id',to:'articles#index'
  get 'articles/find', to:'articles#find', as: :articleFind
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end