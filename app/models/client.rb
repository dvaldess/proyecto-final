class Client < ApplicationRecord
    enum category: [:Comercial, :Educacional, :Gubernamental]
    has_many :contacts, dependent: :destroy
    has_many :orders, dependent: :destroy
    validates :rut, :name, :address, :phone, :category, presence: true
end
