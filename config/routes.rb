Rails.application.routes.draw do
  root "main#index"

  resources :buttons, module: :components, only: :index
  resources :labels, module: :components, only: :index
end
