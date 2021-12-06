class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum title: [:"Gerente General", :"Gerente Comercial", :"SubGerente Comercial", :"Jefe Comercial", :"Ejecutivo de Ventas"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
end
