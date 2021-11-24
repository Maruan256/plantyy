# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require "open-uri"
require "nokogiri"
require "pry"

puts "Destroying all plants"
Plant.destroy_all
puts "Plants destroyed"

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
  Plant.create(name: elem[:name], description: elem[:description], plant_url: elem[:plant_url], sunlight: ["low", "medium", "high"].sample, water: ["low", "medium", "high"].sample, cat: ["toxic", "non-toxic"].sample)
end

puts "#{Plant.count} plants created."

puts "Creating User"

user1 = User.create!(
  first_name: "Yi-An",
  last_name: "Ko",
  username: "yian",
  email: "yian80413@gmail.com",
  address: "Berlin 1",
  password: "123456"
)

puts 'Creating my garden ...'
garden1 = MyGarden.create!(user: user1)

puts 'Creating garden kits...'

GardenKit.create!(
  kit_name: "English Garden",
  plants: [Plant.first],
  my_garden: garden1,
  kit_url: "https://images.unsplash.com/photo-1585320806297-9794b3e4eeae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z2FyZGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
)

GardenKit.create!(
  kit_name: "French Garden",
  plants: [Plant.last],
  my_garden: garden1,
  kit_url: "https://images.unsplash.com/photo-1580600301354-0ce8faef576c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2FyZGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
)

puts 'Finished!'
