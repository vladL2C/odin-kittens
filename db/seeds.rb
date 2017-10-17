# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Generate some kittens
kitten_names = ["kuzar","Boop","Lion","King"]

kitten_names.each do |name|
  Kitten.create(name: name, age: rand(1..10),
    cuteness: rand(1..10), softness: rand(1..10))
end 


