# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gridiron_league = League.create(name: "Gridiron League", category: League.categories[:gridiron])
Franchise.new_gridiron_franchise(city: 'Cibolo', mascot: 'Bison', league: gridiron_league)
Franchise.new_gridiron_franchise(city: 'San Antonio', mascot: 'Scorpions', league: gridiron_league)
Franchise.new_gridiron_franchise(city: 'Houston', mascot: 'Humidity', league: gridiron_league)
Franchise.new_gridiron_franchise(city: 'Vegas', mascot: 'Dealers', league: gridiron_league)
Franchise.new_gridiron_franchise(city: 'Canada', mascot: 'Hosers', league: gridiron_league)
Franchise.new_gridiron_franchise(city: 'Dallas', mascot: 'Fort Worth', league: gridiron_league)
gridiron_league.generate_schedule
street_league = League.create(name: "Street League", category: League.categories[:street])
arena_league = League.create(name: "Arena League", category: League.categories[:arena])
User.create(email: 'test@test.com', password: '123456')