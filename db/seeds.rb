# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# suppressing all the previous seeds
Bar.destroy_all
Category.destroy_all
Drink.destroy_all

# inserting bars
bar = Bar.create(name: "Celtica",
  address: "Rue du Marché aux Poulets 55, 1000 Bruxelles, Belgique",
  description: "Irish bar",
  opening_hours: "
    lundi 13:00–05:00
    mardi 13:00–05:00
    mercredi  13:00–05:00
    jeudi 13:00–06:00
    vendredi  13:00–07:00
    samedi  13:00–07:00
    dimanche  13:00–05:00"
  )

# inserting categories
softs = Category.create(name: "soft")
beers = Category.create(name: "beer")
wines = Category.create(name: "wine")
cocktails = Category.create(name: "cocktails")

# categories array
categories = [softs, beers, wines, cocktails]

sizes = ["5cl", "15cl", "33cl", "50cl", "75cl", "1L"]
prices = [1.3, 2.7, 10, 3.3]

10.times do
  beer = Drink.create(name: Faker::Beer.name, description: Faker::Beer.style, price: prices.sample, size: sizes.sample, category: beers, bar: bar)
end
