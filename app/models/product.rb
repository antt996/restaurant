class Product < ApplicationRecord
    has_many :detail_invoice
    has_many  :invoices, through: :detail_invoices
end
