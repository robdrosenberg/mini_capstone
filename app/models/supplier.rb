class Supplier < ApplicationRecord
  has_many :products

  def as_json
    {
      name: name,
      email: email,
      phone_number: phone_number,
      products: products.map{|product| product.title}
    }
  end
end
