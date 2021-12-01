Rails.application.routes.draw do
  resources :invoices
    scope :invoices do
      get '/:id/pdf.pdf', to: 'invoices#pdf', as: :invoice_pdf
    end
  devise_for :users
    devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
  get 'inicio/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'inicio#index'
# Rutas CRUD productos
  get 'products/index', to:'products#index'
  get 'products/invoice', to: 'products#invoice'
  get 'products/new', to: 'products#new'
  get 'products/:id', to: 'products#show'
  get 'products/:id/edit', to: 'products#edit', as: :product_edit
  patch '/products/:id', to: 'products#update', as: :product
  post 'products', to: 'products#create'
  get '/products/:id/destroy', to: 'products#destroy', as: :product_delete
end
