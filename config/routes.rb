Rails.application.routes.draw do
  get "home/index"
  mount Lookbook::Engine, at: '/docs'

  root 'home#index'
end
