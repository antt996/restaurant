class Invoice < ApplicationRecord
  belongs_to :user
  has_many :detail_invoices
  has_many  :products, through: :detail_invoices
  attr_accessor :product_elements


    def save_products
      return detail_invoices.destroy_all if  product_elements.nil? || product_elements.empty?
      detail_invoices.where.not(product_id: product_elements).destroy_all

      product_elements.each do |product_id|
        DetailInvoice.find_or_create_by(invoice: self, product_id: product_id)
      end
    end

end
