Rails.application.routes.draw do
  get 'inicio/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
# Rutas CRUD productos
  get 'products/index', to:'products#index'
  root to: 'inicio#index'
  get 'products/new', to: 'products#new'
  get 'products/:id', to: 'products#show'
  get 'products/:id/edit', to: 'products#edit'
  patch '/products/:id', to: 'products#update', as: :product
  post 'products', to: 'products#create'
  delete '/products/:id', to: 'products#destroy'
end
