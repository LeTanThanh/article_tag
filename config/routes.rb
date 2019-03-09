Rails.application.routes.draw do
  root "articles#index"

  resources :articles, only: %i|index new create show edit update|
end
