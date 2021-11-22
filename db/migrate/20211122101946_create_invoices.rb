class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nombre_cliente
      t.string :email_cliente
      t.string :total_factura

      t.timestamps
    end
  end
end
