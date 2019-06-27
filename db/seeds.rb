# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Pulling Film Data..."
Film.migrate!

puts "Pulling Planet Data..."
Planet.migrate!

puts "Pulling Character Data..."
Character.migrate!

puts "Pulling Starship Data..."
Starship.migrate!

puts "Pulling Vehicle Data..."
Vehicle.migrate!

puts "Pulling Species Data..."
Species.migrate!

puts "Adding Film Relationships..."
Film.add_relationships!