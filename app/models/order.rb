class Order < ApplicationRecord
  enum category: [:Licitacion, :Directa, :Indirecta, :Cooperativa]
  belongs_to :client, optional: true
  belongs_to :user, optional: true
  validates :category, :date, :description, presence: true
end
