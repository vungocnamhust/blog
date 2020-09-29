Rails.application.routes.draw do
  get 'welcome/index'  # reference to controller Welcome, action index 
  post 'articles/new',to:'articles#create'
  get 'articles/new'
  get 'articles/show',to:'articles#show',as: :articlesShow
  get 'articles/index',to:'articles#index',as: :articleIndex
  get 'articles/find', to:'articles#find', as: :articleFind
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end