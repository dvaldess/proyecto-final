class Order < ApplicationRecord
  enum category: [:Licitacion, :Directa, :Indirecta, :Cooperativa]
  belongs_to :client
  belongs_to :user
  has_many :products, dependent: :destroy
  paginates_per 5
  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
  validates :category, :date, :price, :client_id, :user_id, :product_id, presence: true
end
