# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create([{
     email: "dvaldes@systemx.cl",
     password: "123456",
     password_confirmation: "123456",
     title: 0,
     name: "Diego",
     phone: Faker::PhoneNumber.cell_phone_with_country_code
},{
     email: "isidora@systemx.cl",
     password: "123456",
     password_confirmation: "123456",
     title: 1,
     name: "Isidora",
     phone: Faker::PhoneNumber.cell_phone_with_country_code
},{
    email: "valeria@systemx.cl",
    password: "123456",
    password_confirmation: "123456",
    title: 2,
    name: "Valeria",
    phone: Faker::PhoneNumber.cell_phone_with_country_code
}])

20.times do
    Client.create(
        rut: Faker::ChileRut.full_rut,
        name: Faker::Company.name,
        address: Faker::Address.full_address,
        phone: Faker::Number.number(digits: 9),
        category: 1
    )
end

10.times do
    Client.create(
        rut: Faker::ChileRut.full_rut,
        name: Faker::University.name,
        address: Faker::Address.full_address,
        phone: Faker::Number.number(digits: 9),
        category: 2
    )
end

20.times do
    Contact.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::Number.number(digits: 9),
        title: Faker::Number.between(from: 0, to: 5),
        client_id: Faker::Number.between(from: 0, to: 19)
    )
end

20.times do
    Contact.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::Number.number(digits: 9),
        title: Faker::Number.between(from: 6, to: 7),
        client_id: Faker::Number.between(from: 20, to: 29)
    )
end

20.times do
    Order.create(
        category: Faker::Number.between(from: 0, to: 3),
        date: Faker::Date.backward(days: 14),
        description: Faker::Lorem.paragraph,
        client_id: Faker::Number.between(from: 10, to: 19),
        user_id: Faker::Number.between(from: 1, to: 3),
        price: Faker::Number.between(from: 1000, to: 10000)
    )
end

30.times do
    Product.create(
        name: Faker::Appliance.equipment,
        description: Faker::Lorem.paragraph,
        category: Faker::Number.between(from: 0, to: 2),
        currency: Faker::Number.between(from: 0, to: 2),
        price: Faker::Number.between(from: 1000, to: 10000),
        order_id: Faker::Number.between(from: 1, to: 10)
    )
end
AdminUser.create!(email: 'admin@systemx.cl', password: '123123', password_confirmation: '123123') if Rails.env.development?
