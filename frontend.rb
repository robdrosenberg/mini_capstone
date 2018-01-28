require 'unirest'
require 'tty-prompt'
system "clear"
prompt = TTY::Prompt.new

puts "Welcome to my mini-capstone! Check out all the sweet products, or enter your own."
puts "[1] See Every Product"
puts "[1.5] Search for products with certain title"
puts "[2] See a certain Product"
puts "[3] Create a new Product"
puts "[4] Update a Product"
puts "[5] Delete Product, BE CAREFUL"
puts "[6] Signup!?"

input_choice = gets.chomp

if input_choice == "1"
  puts "Enter 1 to sort by price"
  price_sort_input = gets.chomp
  response = Unirest.get("http://localhost:3000/products?price_sort=#{price_sort_input}")
  products = response.body
  puts JSON.pretty_generate(products)
elsif input_choice == "1.5"
  puts "Enter Title you'd like to search:"
  search_input = gets.chomp
  puts "You've found:"
  response = Unirest.get("http://localhost:3000/products?search=#{search_input}")
  products = response.body
  puts JSON.pretty_generate(products)
elsif input_choice == "2"
  puts "Enter ID of product you are looking for:"
  input_id = gets.chomp
  response = Unirest.get("http://localhost:3000/products/#{input_id}")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_choice == "3"
  params ={}
  puts "Enter title of Product:"
  params[:title] = gets.chomp
  puts "Enter the price:"
  params[:price] = gets.chomp
  puts "Enter a description:"
  params[:description] = gets.chomp

  response = Unirest.post("http://localhost:3000/products",
    parameters: params)
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_choice == "4"
  params = {}
  puts "Enter product id you'd like to update:"
  input_id = gets.chomp
  puts "Enter new title:"
  params["title"] = gets.chomp
  puts "Enter Price:"
  params["price"] = gets.chomp
  puts "Enter Description:"
  params["description"] = gets.chomp
  response = Unirest.patch("http://localhost:3000/products/#{input_id}", parameters: params)
  update_product = response.body
  puts JSON.pretty_generate(update_product)
elsif input_choice == "5"
  puts "Enter the id of the product you'd like to destroy!:"
  input_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/products/#{input_id}")
  puts JSON.pretty_generate(response.body)
elsif input_choice == "6"
  params = {}
  puts "Enter name:"
  params[:name] = gets.chomp
  puts "Email:"
  params[:email] = gets.chomp
  params[:password] = prompt.mask("Password: ")

  response = Unirest.post("http://localhost:3000/users", parameters: params)
  new_user = response.body
  puts JSON.pretty_generate(new_user)
end




