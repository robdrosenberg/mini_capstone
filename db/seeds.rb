# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#added to DB already
# blue_yeti = Product.new(title: "BlueYeti Microphone", price: "120", image_url: "https://pisces.bbystatic.com/image2/BestBuy_US/images/products/9737/9737441_sa.jpg", description: "Premium microphone for recording and voice chat. Great for podcasts or any other audio recording!")
# blue_yeti.save

Product.create({title: "Seiko Watch", price: 105, description: "A nice silver watch to wear on the go. Great for keeping time and making you on time!", image_url: "http://seikousa.com/images/homepage/Seiko_HomepageBanner_Presage_WatchLayer.png", })
Product.create({title: "Hydro Flask", price: 35, description: "The best water bottle ever. Ice foreva!"})
Product.create({title: "Herbal Tea", price: 1.5, description: "Yummy and dirt cheap! But not made with dirt. I promise!"})