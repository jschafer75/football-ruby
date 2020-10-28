# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

league = League.create(name: "Peanut Butter League")
Franchise.create(city: 'Cibolo', mascot: 'Bison', league: league)
Franchise.create(city: 'San Antonio', mascot: 'Scorpions', league: league)
Franchise.create(city: 'Houston', mascot: 'Humidity', league: league)
Franchise.create(city: 'Vegas', mascot: 'Dealers', league: league)
Franchise.create(city: 'Canada', mascot: 'Hosers', league: league)
Franchise.create(city: 'Dallas', mascot: 'Fort Worth', league: league)
league.generate_schedule
User.create(email: 'test@test.com', password: '123456')