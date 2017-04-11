Rails.application.routes.draw do
  get 'home/index'
  resources :layouts, only: :index

  root 'home#index'

end
