# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

league = League.create(name: "Peanut Butter League")
Franchise.new_gridiron_franchise(city: 'Cibolo', mascot: 'Bison', league: league)
Franchise.new_gridiron_franchise(city: 'San Antonio', mascot: 'Scorpions', league: league)
Franchise.new_gridiron_franchise(city: 'Houston', mascot: 'Humidity', league: league)
Franchise.new_gridiron_franchise(city: 'Vegas', mascot: 'Dealers', league: league)
Franchise.new_gridiron_franchise(city: 'Canada', mascot: 'Hosers', league: league)
Franchise.new_gridiron_franchise(city: 'Dallas', mascot: 'Fort Worth', league: league)
league.generate_schedule
User.create(email: 'test@test.com', password: '123456')