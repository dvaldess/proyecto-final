class Product < ApplicationRecord
  enum category: [:Servicio, :Software, :Hardware]
  enum currency: [:Peso, :USD, :UF,]
  belongs_to :order, optional: true
  paginates_per 5
  validates :name, :category, :currency, :price, presence: true
end
