# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

elliott = Cat.create(name:'Elliott', color: 'black', sex: 'M', description: "CATS ARE GREAT", birthdate: Date.new(2014,6,6))
debra = Cat.create(name:'Debra', color: 'brown', sex: 'F', description: "CATS SUCK", birthdate: Date.new(2015,6,6))
aaron = Cat.create(name:'Aaron', color: 'blue', sex: 'M', description: "CATS ARE My FAVORITE", birthdate: Date.new(2000,6,6))
snookums = Cat.create(name:'Snookums', color: 'calixico', sex: 'F', description: "We are the rightful rulers of earth.", birthdate: Date.new(1764,1,2))
luke = Cat.create(name:'Luke', color: 'grey', sex: 'M', description: "Cats are so cute.", birthdate: Date.new(2012,6,6))
