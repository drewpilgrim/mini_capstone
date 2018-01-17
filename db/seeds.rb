# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.create({title:"Book", price:"A lot", image_url:"google.com", description:"A book"}).save

Product.create({title:"Another Book", price:"A lot", image_url:"google.com", description:"A book"}).save

Product.create({title:"A third Book", price:"A lot", image_url:"google.com", description:"A book"}).save

Product.create({title:"A fourth Book", price:"A lot", image_url:"google.com", description:"A book"}).save