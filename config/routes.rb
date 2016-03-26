Rails.application.routes.draw do
  root to: 'pages#index'
  resources :legacies, only: [:index, :show]
end
