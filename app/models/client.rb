class Client < ApplicationRecord
    enum category: [:Comercial, :Educacional, :Gubernamental]
    has_many :contacts
    has_many :orders
    validates :rut, :name, :address, :phone, :category, presence: true
end
