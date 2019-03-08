Rails.application.routes.draw do
  root "articles#index"

  resources :articles, only: %i|index show|
end
