json.extract! invoice, :id, :user_id, :nombre_cliente, :email_cliente, :total_factura, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
