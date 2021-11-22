class CreateDetailInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :detail_invoices do |t|
      t.references :product, null: false, foreign_key: true , default: 1
      t.references :invoice, null: false, foreign_key: true , default: 1

      t.timestamps
    end
  end
end
