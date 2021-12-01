# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require "open-uri"
require "nokogiri"
puts "Destroying all people"
User.destroy_all
puts "people destroyed"

puts "Destroying all garden_kits"
GardenKit.destroy_all
puts "garden_kits destroyed"

puts "Destroying all plants"
Plant.destroy_all
puts "Plants destroyed"

puts "Destroying all gardens"
MyGarden.destroy_all
puts "gardens destroyed"



def fetch_plant_urls
  all_url = "https://www.ikea.com/ie/en/cat/plants-10779/"
  doc = Nokogiri::HTML(URI.open(all_url).read)
  plants = doc.search(".range-revamp-product-compact__bottom-wrapper a")
  plants.take(50).map do |plant|
    uri = URI.parse(plant.attributes["href"].value)
    uri.scheme = "https"
    uri.host = "www.ikea.com"
    uri.query = nil
    uri.to_s
  end
end

def scrape_plant(url)
  doc = Nokogiri::HTML(URI.open(url, "Accept-Language" => "en-US").read)
  name = doc.search('.range-revamp-header-section__title--big').text
  description = doc.search('p.range-revamp-product-summary__description').text
  plant_url = doc.search('.range-revamp-aspect-ratio-image__image').attribute('src').value
  {
    name: name,
    # cast: cast,
    # director: director,
    description: description,
    # year: year
    plant_url: plant_url
  }
end

puts "Fetching URLs"
urls = fetch_plant_urls
plants_hashes = []

urls.map do |url|
  puts "Scraping #{url}"
  plants_hashes << scrape_plant(url)
end

puts plants_hashes

puts "Creating plants."

plants_hashes.each do |elem|
  Plant.create(name: elem[:name], description: elem[:description], plant_url: elem[:plant_url], sunlight: ["691200", "259200", "86400"].sample, water: ["1", "1", "100000000000000000000000000"].sample, cat: ["toxic", "non-toxic"].sample)
end

puts "#{Plant.count} plants created."

puts "Creating User"

user_one = User.create!(
  first_name: "Yi-An",
  last_name: "Ko",
  username: "yian",
  email: "yian80413@gmail.com",
  address: "Berlin 1",
  password: "123456"
)

user_two = User.create!(
  first_name: "Akiho",
  last_name: "Hamamoto",
  username: "akiho",
  email: "ahamamoto1125@gmail.com",
  address: "Berlin 2",
  password: "ahamamoto1125@gmail.com"
)

puts 'Creating my garden ...'
garden_one = MyGarden.create!(user: user_one)
garden_two = MyGarden.create!(user: user_two)

puts 'Creating garden kits...'

GardenKit.create!(
  kit_name: "English Garden",
  price: "50",
  plants: [Plant.first],
  my_garden: garden_one,
  description: "Want a cuppa tea? This garden will make you feel like a queen👑",
  kit_url: "https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z2FyZGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
)

GardenKit.create!(
  kit_name: "French Garden",
  price: "39.99",
  plants: [Plant.last],
  my_garden: garden_two,
  description: "Plant this kit, you won't need that flight ticket to see Versailles anymore!🥖",
  kit_url: "https://images.unsplash.com/photo-1580600301354-0ce8faef576c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2FyZGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
)

GardenKit.create!(
  kit_name: "Cozy Garden",
  price: "49.99",
  plants: [Plant.all.sample, Plant.all.sample, Plant.all.sample],
  my_garden: garden_two,
  description: "Do you want to make your place feel more like home? This kit is made for you🏠",
  kit_url: "https://images.unsplash.com/photo-1511671090499-b715092e944f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y296eSUyMGdhcmRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"
)

GardenKit.create!(
  kit_name: "Tropical Garden",
  price: "60",
  plants: [Plant.all.sample, Plant.all.sample, Plant.all.sample],
  my_garden: garden_one,
  description: "We all know how the winter could be, let's pretend we are in a tropical country by planting this kit🌴",
  kit_url: "https://images.unsplash.com/photo-1470058869958-2a77ade41c02?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dHJvcGljYWwlMjBnYXJkZW58ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"
)

GardenKit.create!(
  kit_name: "Fresh Garden",
  price: "50",
  plants: [Plant.all.sample, Plant.all.sample, Plant.all.sample],
  my_garden: garden_one,
  description: "Are you a fan of frech herbs and smell? Buy this kit to get all the herbs from your own garden🍅",
  kit_url: "https://images.unsplash.com/photo-1515150144380-bca9f1650ed9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnJlc2glMjBnYXJkZW58ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"
)

GardenKit.create!(
  kit_name: "Classic Garden",
  price: "29.99",
  plants: [Plant.all.sample, Plant.all.sample, Plant.all.sample],
  my_garden: garden_two,
  description: "You don't know what you want yet? Get this classic garden kit as a start 😉",
  kit_url: "https://images.unsplash.com/photo-1470755008296-2939845775eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGdhcmRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"
)

puts 'Finished!'
