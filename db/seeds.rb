# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: 'Penelope', email: 'penelope@aol.com')
User.create!(username: 'Grackle', email: 'grackleoptics@outlook.com')
User.create!(username: 'Common Dream', email: 'daydreaming21@gmail.com')
User.create!(username: 'Melonhead22', email: 'melonhead3344@gmail.com')

Activity.create!(name: "Hiking", date: "Oct. 1, 2021", location: "Camp Flemington, Flemington, NJ")
Activity.create!(name: "Volunteering", date: "Oct. 1, 2021", location: "Weequahic Park, Newark, NJ")
Activity.create!(name: "Rock Climbing", date: "Oct. 1, 2021", location: "Gravity Vault, Montclair, NJ")
Activity.create!(name: "Concert", date: "Oct. 1, 2021", location: "Orchard Park, NY")
Activity.create!(name: "Basketball", date: "Oct. 1, 2021", location: "Orange Park, East Orange, NJ")