Rails.application.routes.draw do
  resources :short_links
  root 'short_links#index'
  get 'short_links/fetch/:slug', to: 'short_links#fetch'
end
