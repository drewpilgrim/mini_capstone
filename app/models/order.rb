class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :carted_product
  has_many :user, through: :category_products
  has_many :products, through: :category_products
end
