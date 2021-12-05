# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@systemx.cl', password: '123123', password_confirmation: '123123') if Rails.env.development?


require 'faker'

User.create([{
     name: "Diego",
     email: "dvaldes@test.cl",
     password: "123456",
     password_confirmation: "123456",
     title: "",
},{
     name: "Isidora",
     email: "isidora@test.cl",
     password: "123456",
     password_confirmation: "123456"
},{
    username: "Valeria",
    email: "valeria@test.cl",
    password: "123456",
    password_confirmation: "123456"
}])