class Invoice < ApplicationRecord
  belongs_to :user
  has_many  :products, through: :detail_invoices

  attr_accessor :product_elements


  # def save_products
  #   products_array = product_elements.try(:split, ",")
  
  #   products_array.each do |product|
  #     Detailinvoice.create(invoice: self, product_id: product)
  #   end
  # end
end
