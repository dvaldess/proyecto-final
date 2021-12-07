class Order < ApplicationRecord
  enum category: [:Licitacion, :Directa, :Indirecta, :Cooperativa]
  belongs_to :client
  belongs_to :user
  validates :category, :date, :description, :client_id, :user_id, :price, presence: true
end
