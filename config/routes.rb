Rails.application.routes.draw do
  resources :short_links
  root to:'short_links#index'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
