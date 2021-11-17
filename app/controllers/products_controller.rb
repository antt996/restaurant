class ProductsController < ApplicationController
    before_action :find_product, except: [:new,:create, :index]
    def show
     
    end
    def index
        @products = Product.all
    end
    

    def edit
       
        
    end
    def update
       
        @id = Product.find(params[:id])
        @product =  Product.update(name: params[:product][:name], price: params[:product][:price], stock: params[:product][:stock])
        
        redirect_to @id
    end
    def new
        @product = Product.new
        
    end

    def create
      @product =  Product.create(name: params[:product][:name], price: params[:product][:price], stock: params[:product][:stock])
      render json: @product
    end

    def destroy
       
       @product.destroy
       redirect_to root_path
        
    end
    def find_product
        @product = Product.find(params[:id])
    end
    

end
