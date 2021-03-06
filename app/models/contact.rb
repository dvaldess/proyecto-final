class Contact < ApplicationRecord
    enum title: [:"Gerente TI", :"SubGerente TI", :"Jefe TI", :"Ingeniero TI", :"Tecnico TI", :Administrativo, :Rector, :"Director de Carrera"]
    belongs_to :client
    paginates_per 5
    validates :name, :email, :phone, :title, :client_id, presence: true
end