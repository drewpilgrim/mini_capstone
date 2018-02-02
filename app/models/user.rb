class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :carted_products
  has_many :orders, through: :category_products
  has_many :products, through: :category_products  


  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
