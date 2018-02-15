Supplier.create!([
  {name: "Amazon", email: "lord@amazon.com", phone_number: "2064457389"},
  {name: "Google", email: "googs@google.com", phone_number: "5609123674"},
  {name: "New Egg", email: "new@eggs.com", phone_number: "8195746223"}
])
User.create!([
  {name: "Test", email: "test@test.com", password_digest: "$2a$10$rsZfQrN5UJ5YMh4KvZTYRuWzLNnggStWH0oGXO8otd/gIWRJQGR5S", admin: false},
  {name: "Rob", email: "rob@rob.com", password_digest: "$2a$10$wlYUzqmeuX1k/lr8CVZlA.wQ/dHHG1VA3d6OHtFRw.fPDNkOqSRlG", admin: true}
])
Product.create!([
  {title: "Hydro Flask", price: "35.0", image_url: nil, description: "The best water bottle ever. Ice foreva!", in_stock: true, supplier_id: 1},
  {title: "Herbal Tea", price: "1.5", image_url: nil, description: "Yummy and dirt cheap! But not made with dirt. I promise!", in_stock: true, supplier_id: 1},
  {title: "Seiko Watch", price: "105.0", image_url: "http://seikousa.com/images/homepage/Seiko_HomepageBanner_Presage_WatchLayer.png", description: "A nice silver watch to wear on the go. Great for keeping time and making you on time!", in_stock: true, supplier_id: 3},
  {title: "Bubble Tea", price: "5.0", image_url: nil, description: nil, in_stock: true, supplier_id: 2}
])

CartedProduct.create!([
  {user_id: 2, product_id: 5, quantity: 3, status: "purchased", order_id: 3},
  {user_id: 2, product_id: 2, quantity: 1, status: "purchased", order_id: 3},
  {user_id: 1, product_id: 2, quantity: 1, status: "removed", order_id: nil}
])
Category.create!([
  {title: "gadgets"},
  {title: "drinking"}
])
CategoryProduct.create!([
  {product_id: 3, category_id: 1},
  {product_id: 1, category_id: 2},
  {product_id: 2, category_id: 1},
  {product_id: 4, category_id: 2}
])
Order.create!([
  {user_id: 1, subtotal: "105.0", tax: "9.45", total: "114.45"},
  {user_id: 2, subtotal: "70.0", tax: "6.3", total: "76.3"},
  {user_id: 2, subtotal: "120.0", tax: "10.8", total: "130.8"}
])
