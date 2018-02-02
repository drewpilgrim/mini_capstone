class Product < ApplicationRecord
  belongs_to :supplier
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :category_products
  has_many :user, through: :category_products
  has_many :orders, through: :category_products
  
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, length: {in: 5..500}
  validates :price, presence: true
  validates :string, presence: true, if: :validate_false



  def validate_false 
    return false
  end

  def is_discounted? 
    if price.to_f >= 2
      return false
    else 
      return true
    end
  end


  def tax
    return price.to_f * 0.09
  end

  def total
    return price.to_f + tax
  end

  def as_json
    {
      title: title,
      description: description, 
      price: price,
      tax: tax,
      total_price: total,
      supplier: supplier.as_json
    }
  end



end
