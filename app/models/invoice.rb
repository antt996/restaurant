class Invoice < ApplicationRecord
  belongs_to :user
  has_many :detail_invoices
  has_many  :products, through: :detail_invoices
  attr_accessor :product_elements
  attr_accessor :product_quantity
  

  # def save_quantity
     
  #  end
   
    def save_products
      
      return detail_invoices.destroy_all if  product_elements.nil? || product_elements.empty?
      detail_invoices.where.not(product_id: product_elements).destroy_all
      
            #Recibe y limpia el ARRAY de espacios en blancos
            @quantity = product_quantity - [""]
            #Itera el array 

      # list = [product_elements.product_id, product_quantity.product_quantity]
      product_elements.zip(@quantity).each do |(product_id, product_quantity)|
        
         
          DetailInvoice.find_or_create_by(invoice: self, product_id: product_id, product_quantity: product_quantity)

        
      end 
      
     
    end

end
