class Order < ApplicationRecord
  enum category: [:Licitacion, :Directa, :Indirecta, :Cooperativa]
  belongs_to :client
  belongs_to :user
  validates :category, :date, :description, presence: true
end
