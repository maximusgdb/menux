# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# suppressing all the previous seeds

User.destroy_all
Bar.destroy_all
Order.destroy_all
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
    dimanche  13:00–05:00",
  number_of_tables: 10
  )

big_games = Bar.create(name: "The Big Games",
  address: "Rue Henri Maus 5, 1000 Bruxelles",
  description: "Brusseleirs bar",
  opening_hours: "
    vendredi  12:00–07:00
    samedi  12:00–07:00
    dimanche  12:00–05:00
    lundi 12:00–05:00
    mardi 12:00–05:00
    mercredi  12:00–05:00
    jeudi 12:00–05:00",
  number_of_tables: 0
  )

deli = Bar.create(name: "Delirium Café",
  address: "Impasse de la Fidélité 4, 1000 Bruxelles",
  description: "Bar avec plus de 2 000 bières, concerts le jeudi soir et objets de déco sur l'univers de la brasserie.",
  opening_hours: "dimanche  10:00–02:00
    lundi 10:00–04:00
    mardi 10:00–04:00
    mercredi  10:00–04:00
    jeudi 10:00–04:00
    vendredi  10:00–04:00
    samedi  10:00–04:00",
  number_of_tables: 100
  )

lewagon = Bar.create(name: "Le Wagon Bar",
  address: "Parvis Sainte-Gudule 5, 1000 Brussel",
  description: "Bar de codeurs où la bière se mélange à la technologie.",
  opening_hours: "dimanche  10:00–02:00
    lundi 10:00–04:00
    mardi 10:00–04:00
    mercredi  10:00–04:00
    jeudi 10:00–04:00
    vendredi  10:00–04:00
    samedi  10:00–04:00",
  number_of_tables: 20
  )

# inserting categories
softs = Category.create(name: "soft")
beers = Category.create(name: "beer")
wines = Category.create(name: "wine")
cocktails = Category.create(name: "cocktails")

# categories array
categories = [softs, beers, wines, cocktails]

sizes = ["5cl", "15cl", "33cl", "50cl", "75cl", "1L"]
prices = [130, 270, 100, 330]

10.times do
  beer = Drink.create(name: Faker::Beer.name, description: Faker::Beer.style, price_cents: prices.sample, size: sizes.sample, category: beers, bar: bar)

  wine = Drink.create(name: Faker::Cat.name, description: Faker::Cat.breed, price_cents: prices.sample, size: sizes.sample, category: softs, bar: bar)

  beer = Drink.create(name: Faker::Beer.name, description: Faker::Beer.style, price_cents: prices.sample, size: sizes.sample, category: categories.sample, bar: big_games)
  beer = Drink.create(name: Faker::Beer.name, description: Faker::Beer.style, price_cents: prices.sample, size: sizes.sample, category: categories.sample, bar: deli)
end

2.times do
  User.create(email: Faker::Internet.email, password: "aaaaaa", name: Faker::Name.name, waiter: true, bar_id: 2 )
end

User.create(email: "matthieudou@matthieudou", password: "matthieudou", name: "matthieudou")
User.create(email: "test@test.be", password: "password", name: "test", admin: true, waiter: true, bar_id: 2)

Drink.create(name: "Jupiler", description: Faker::Beer.style, price_cents: 120, size: "33cl", category: beers, bar: lewagon)
Drink.create(name: "Maes", description: Faker::Beer.style, price_cents: 150, size: "33cl", category: beers, bar: lewagon)
Drink.create(name: "La Chouffe", description: Faker::Beer.style, price_cents: 200, size: "33cl", category: beers, bar: lewagon)
Drink.create(name: "Westmalle Tripel", description: Faker::Beer.style, price_cents: 220, size: "33cl", category: beers, bar: lewagon)
Drink.create(name: "Kriek", description: Faker::Beer.style, price_cents: 190, size: "33cl", category: beers, bar: lewagon)
Drink.create(name: "Bière Le Wagon", description: Faker::Beer.style, price_cents: 110, size: "50cl", category: beers, bar: lewagon)
Drink.create(name: "La Ruby", description: Faker::Beer.style, price_cents: 180, size: "50cl", category: beers, bar: lewagon)
