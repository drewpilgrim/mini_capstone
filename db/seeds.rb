Supplier.destroy_all

Supplier.create({name:"Borders", email:"Borders@gmail.com", phone_number:"555-5555"})

Supplier.create({name:"Amazon", email:"Amazon@amazon.com", phone_number:"999-9999"})


Product.destroy_all

Product.create({title:"Book", price:"5.25", image_url:"google.com", description:"A book", supplier_id: 1})

Product.create({title:"A textbook", price:"5000.00", image_url:"google.com", description:"An overpriced book", supplier_id: 2})

Product.create({title:"A popular book", price:"14.50", image_url:"google.com", description:"A popular book", supplier_id: 2})

Product.create({title:"A Book", price:"6.75", image_url:"google.com", description:"A book", supplier_id: 2})


