Rails.application.routes.draw do

  resources :rovers
  post '', to: 'rovers#instruction', as: 'instruction'

  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
