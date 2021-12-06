class Contact < ApplicationRecord
    enum title: [:"Gerente TI", :"SubGerente TI", :"Jefe TI", :"Ingeniero TI", :"Tecnico TI", :Administrativo, :Rector, :"Director de Carrera"]
    belongs_to :client
    validates :name, :email, :phone, :title, presence: true
end