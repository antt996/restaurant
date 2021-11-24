# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  user = User.create(
    email: 'test@test.com', 
    password: '123456'
    )

  product = Product.create(
    name: 'Italian food', 
    price: 100.00, stock: 5
    )


  invoice = Invoice.create(
    nombre_cliente: 'tito',
    email_cliente: 'test@test.com',
    total_factura: '200', # <=========== this is a Integer not a string
    user_id: user.id
  )


  DetailInvoice.create(
    product_id: product.id,
    invoice_id: invoice.id)

  