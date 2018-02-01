class Product < ApplicationRecord
  
  belongs_to :supplier
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products

  validates :title, length: { minimum: 2 }
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :price, presence: true
  validates :description, length: { maximum: 500 }

  def is_discounted?
    if price.to_f < 2
      discounted = true
    else
      discounted = false
    end
    discounted
  end

  def tax
    tax = price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end

  def clean_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def clean_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def as_json
    {
      id: id,
      title: title,
      price: price,
      tax: tax,
      total: total,
      discounted: is_discounted?,
      image_url: image_url,
      description: description,
      in_stock: in_stock,
      created_at: clean_created_at,
      updated_at: clean_updated_at,
      supplier: supplier.as_json,
      categories: categories.map {|category| category.title}
    }
  end
end
