class Invoice < ApplicationRecord
  belongs_to :user
  has_many  :products, through: :detail_invoices

  attr_accessor :product_elements


  
end
