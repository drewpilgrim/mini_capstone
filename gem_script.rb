require "unirest"
require "tty-table"
jwt = nil

while true
  system "clear"
  response = Unirest.get("http://localhost:3000/users/admin")
  admin = response.body["admin"]
  puts "Welcome to the Product app! Select an option:"
  if jwt
    puts "[1] See all products"
    puts "[2] See one product"
  end
  if admin == "true"
    puts "[3] Create a product"
    puts "[4] Update a product"
    puts "[5] Destroy a product"
  end
  puts "[6] Create a user"
  puts "[7] Login"
  puts "[8] Logout"
  puts "[9] Create an order"
  if jwt
    puts "[10] Show Orders for user"
  end

  puts "[11] Show all categories"
  puts "[12] Show all products from a particular category"

  if jwt 
    puts "[13] Cart a product"
    puts "[14] Show all products"
  end
  puts "[q] Quit"

  input_option = gets.chomp
  if input_option == "1"
    puts "If you want to search by the title please enter a search term"
    search_term = gets.chomp
    response = Unirest.get("http://localhost:3000/products?search=#{search_term}")
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

  elsif input_option == "6"
    params = {}
    puts "Enter a username"
    params["name"] = gets.chomp
    puts "Enter an email"
    params["email"] = gets.chomp
    puts "Enter a password"
    params["password"] = gets.chomp
    puts "Password Confirmation"
    params["password_confirmation"] = gets.chomp
    response = Unirest.post("http://localhost:3000/users", parameters: params)
    puts JSON.pretty_generate(response.body)
  elsif input_option == "7"
    puts "Email: "
    input_email = gets.chomp
    puts "Password: "
    input_password = gets.chomp
    response = Unirest.post("http://localhost:3000/user_token", parameters: {auth: {email: input_email, password:input_password}})
    if response.body
      jwt = response.body["jwt"]
      puts response.body
      Unirest.default_header("Authorization", "Bearer #{jwt}")
    else
      puts "Wrong login"
    end

  elsif input_option == "8"
    jwt = ""
    Unirest.clear_default_headers
  elsif input_option == "9"
    params = {}
    puts "User ID"
    params["user_id"] = gets.chomp
    puts "Product ID"
    params["product_id"] = gets.chomp
    puts "Quantity"
    params["quantity"] = gets.chomp
    response = Unirest.post("http://localhost:3000/orders", parameters: params)
    puts JSON.pretty_generate(response.body)

  elsif input_option == "10"
    response = Unirest.get("http://localhost:3000/orders")
    puts JSON.pretty_generate(response.body)

  elsif input_option == "11"
    response = Unirest.get("http://localhost:3000/categories")
    puts JSON.pretty_generate(response.body)
  elsif input_option == "12"
    puts "Please enter an ID for the category you want to search for"
    cat_id = gets.chomp
    response = Unirest.get("http://localhost:3000/categories/#{cat_id}")
    puts JSON.pretty_generate(response.body)
  elsif input_option == "13"
    params = {}
    puts "Enter Product id"
    params["product_id"] = gets.chomp
    puts "Enter Quantity"
    params["quantity"] = gets.chomp

    response = Unirest.post("http://localhost:3000/carted_products", parameters: params)
    puts JSON.pretty_generate(response.body)
  elsif input_option == "14"
    response = Unirest.get("http://localhost:3000/carted_products")
    puts JSON.pretty_generate(response.body)
    
  elsif input_option == "q"
    break
  end
    
  puts "Enter to continue"
  gets.chomp
end


