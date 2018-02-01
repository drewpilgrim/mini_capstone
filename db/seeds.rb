Supplier.destroy_all

Supplier.create({name:"Borders", email:"Borders@gmail.com", phone_number:"555-5555"})

Supplier.create({name:"Amazon", email:"Amazon@amazon.com", phone_number:"999-9999"})


Product.destroy_all

Product.create({title:"Book", price:"5.25", image_url:"google.com", description:"A book", supplier_id: 1})

Product.create({title:"A textbook", price:"5000.00", image_url:"google.com", description:"An overpriced book", supplier_id: 2})

Product.create({title:"A popular book", price:"14.50", image_url:"google.com", description:"A popular book", supplier_id: 2})

Product.create({title:"A Book", price:"6.75", image_url:"google.com", description:"A book", supplier_id: 2})

Product.create({title:"Worm", price:"50.00", image_url:"parahumans.net", description:"About time it came out", supplier_id: 2})


Category.create(title:"Light Reading")

Category.create(title:"Textbook")


CategoryProduct.create(product_id:2, category_id:2)

CategoryProduct.create(product_id:5, category_id:1)


User.create(name:"Drew", email:"drew@gmail.com", password:"password", admin:true)

User.create(name:"Matt", email:"matt@gmail.com", password:"password", admin:false)

User.create(name:"Test", email:"test@gmail.com", password:"password", admin:false)


Order.create(user_id:1, product_id:2, quantity:3)

Order.create(user_id:3, product_id:1, quantity:1)

Order.create(user_id:2, product_id:5, quantity:2)
