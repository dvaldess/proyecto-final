class Product < ApplicationRecord
  enum category: [:Servicio, :Software, :Hardware]
  enum currency: [:Peso, :USD, :UF,]
  belongs_to :order, optional: true
  validates :name, :description, :category, :currency, :price, presence: true
end
