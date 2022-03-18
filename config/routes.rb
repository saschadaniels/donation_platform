Rails.application.routes.draw do
  resources :translations
  resources :items
  resources :locations
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
