class ProductsController < ApplicationController
  before_action :find_product, except: [:new, :create, :index]
  before_action :authenticate_user!
    def show
     
    end
    def index
        @products = Product.all
    end
    

    def edit
       
        
    end
    def update
       
      
        @product =  @product.update(name: params[:product][:name], price: params[:product][:price], stock: params[:product][:stock])
        
        redirect_to products_index_path
    end
    def new
        @product = Product.new
        
    end

    def create
      @product =  Product.create(name: params[:product][:name], price: params[:product][:price], stock: params[:product][:stock])
      
      redirect_to products_index_path
    end

    def destroy
       
       @product.destroy
       redirect_to root_path
        
    end
    def find_product
        @product = Product.find(params[:id])
    end
    

end
