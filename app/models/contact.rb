class Contact < ApplicationRecord
    enum title: [:Gerente, :SubGerente, :Jefe, :Ingeniero, :Tecnico, :Administrativo]
    belongs_to :client
    validates :name, :email, :phone, :title, presence: true
end