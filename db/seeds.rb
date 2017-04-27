# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# create 20 random users
20.times do
    User.create!(
        username: Faker::Name.unique.first_name,
        email: Faker::Internet.email
    )
end

# create 50 random products
50.times do
    Product.create!(
        stock: Faker::Number.between(1, 10),
        name: Faker::Commerce.unique.product_name,
        price: Faker::Commerce.price,
        user_id: Faker::Number.between(1, 20),
        photo: Faker::LoremPixel.image('50x60'),
        status: true
    )
end

# create 10 random categories
10.times do
    Category.create!(
        name: Faker::Commerce.unique.department
    )
end

# create 50 random orders
50.times do
    Order.create!(
        status: 'complete',
        email_address: Faker::Internet.email,
        mailing_address: Faker::Lorem.sentence,
        card_name: Faker::Name.unique.first_name,
        card_expiration: Date.today,
        card_cvv: 434,
        zipcode: 55_555
    )
end

# create 50 random reviews
50.times do
    Review.create!(
        rating: Faker::Number.between(1, 5),
        comment: Faker::Lorem.sentence,
        product_id: Faker::Number.between(1, 50)
    )
end

# JOIN TABLES

# create 50 random product_categories
50.times do
    ProductCategory.create!(
        category_id: Faker::Number.between(1, 10),
        product_id: Faker::Number.between(1, 50)
    )
end
#
# # create 50 random product_orders
50.times do
    ProductOrder.create!(
        product_id: Faker::Number.between(1, 50),
        order_id: Faker::Number.between(1, 20),
        quantity: 1
    )
end
#
# # create 20 random user_orders
20.times do
    UserOrder.create!(
        user_id: Faker::Number.between(1, 20),
        order_id: Faker::Number.between(1, 50)
    )
end
