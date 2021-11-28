class AddProductQuantityColumnToDetailInvoice < ActiveRecord::Migration[6.1]
  def change
    add_column :detail_invoices, :product_quantity, :integer
  end
end
