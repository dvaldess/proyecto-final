class Order < ApplicationRecord
  enum category: [:Licitacion, :Directa, :Indirecta, :Cooperativa]
  belongs_to :client
  belongs_to :user
  has_many :products, dependent: :destroy
  validates :category, :date, :description, :price, :client_id, :user_id, :product_id, presence: true
end
