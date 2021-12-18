class Client < ApplicationRecord
    enum category: [:Comercial, :Educacional, :Gubernamental]
    has_many :contacts, dependent: :destroy
    has_many :orders, dependent: :destroy
    paginates_per 5
    validates :rut, :name, :address, :phone, :category, presence: true
end
