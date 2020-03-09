# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kitten_descs = [
  ['Tom', '2 months', 'cuty', 'soft'],
  ['Rob', '1 month', 'nice', 'squishy'],
  ['Himler', '3 months', 'harsh', 'so-so'],
  ['Kitty', '4 months', 'angel', 'doughy'],
  ['Satan', '2 months', 'devil', 'rude'],
  ['Stalin', '6 months', 'cocky', 'spongy']
]

Kitten.insert_all(
  kitten_descs.map do |desc|
    {name: desc.first,
     age: desc.second,
     cuteness: desc.third,
     softness: desc.last,
     created_at: Time.now,
     updated_at: Time.now}
  end
)
