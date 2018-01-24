require "unirest"
require "tty-table"

system "clear"

puts "Welcome to the Product app! Select an option:"
puts "[1] See all products"
puts "[2] See one product"
puts "[3] Create a product"
puts "[4] Update a product"
puts "[5] Destroy a product"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/products")
  puts JSON.pretty_generate(response.body)
elsif input_option == "2"
  puts "Enter an ID"
  id = gets.chomp
  response = Unirest.get("http://localhost:3000/products/#{id}")
  puts JSON.pretty_generate(response.body)
elsif input_option == "3"
  params = {}
  puts "Enter a product title: "
  params["title"] = gets.chomp
  puts "Enter a product price: "
  params["price"] = gets.chomp
  puts "Enter a product string: "
  params["string"] = gets.chomp
  puts "Enter a product description: "
  params["description"] = gets.chomp
  puts "Enter a recipe image url: "
  params["image_url"] = gets.chomp
  response = Unirest.post("http://localhost:3000/products", parameters: params)
  puts JSON.pretty_generate(response.body)
elsif input_option == "4"
    params = {}
    puts "Enter an ID"
    params["id"] = gets.chomp
    puts "Enter a new title"
    params["title"] = gets.chomp
    puts "Enter a new description"
    params["descrption"] = gets.chomp
    puts "Enter a new price"
    params["price"] = gets.chomp.to_f
    response = Unirest.patch("http://localhost:3000/products/#{params['id']}", parameters: params)
    puts JSON.pretty_generate(response.body)

elsif input_option == "5"
  params = {}
  puts "Enter an ID"
  params["id"] = gets.chomp
  response = Unirest.delete("http://localhost:3000/products/#{params['id']}", parameters: params)
  puts JSON.pretty_generate(response.body)
end


