# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning DB..."
GardenKit.destroy_all
Plant.destroy_all

puts "creating plants..."

Plant.create!(
  name: "Monstera",
  plant_url: "https://images.unsplash.com/photo-1617173944883-6ffbd35d584d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bW9uc3RlcmF8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"
)

Plant.create!(
  name: "Rubber tree",
  plant_url: "https://images.unsplash.com/photo-1477554193778-9562c28588c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cnViYmVyJTIwdHJlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"
)

Plant.create!(
  name: "Tulip",
  plant_url: "https://images.unsplash.com/photo-1518701005037-d53b1f67bb1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dHVsaXB8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"
)

puts 'Creating garden kits...'

GardenKit.create!(
  kit_name: "British garden",
  plant_id: Plant.first.id,
  kit_url: "hhttps://images.unsplash.com/photo-1590931803077-ae8116f15edc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJyaXRpc2glMjBnYXJkZW58ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"
)

GardenKit.create!(
  kit_name: "Hello Spring",
  plant_id: Plant.last.id,
  kit_url: "https://images.unsplash.com/photo-1490750967868-88aa4486c946?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3ByaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
)

puts 'Finished!'

puts 'Creating conditions...'

Condition.create!(
  title: "cat friendly"
)
Condition.create!(
  title: "not cat friendly"
)
Condition.create!(
  title: "water amount-high"
)

Condition.create!(
  title: "water amount-medium"
)

Condition.create!(
  title: "water amount-low"
)

Condition.create!(
  title: "sunshine amount-high"
)

Condition.create!(
  title: "sunshine amount-medium"
)

Condition.create!(
  title: "sunshine amount-low"
)

puts "Conditions created!"
