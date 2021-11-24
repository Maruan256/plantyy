# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# puts "cleaning DB..."
# GardenKit.destroy_all
# Plant.destroy_all

# puts "creating plants..."

# Plant.create!(
#   name: "Monstera",
#   plant_url: "https://images.unsplash.com/photo-1617173944883-6ffbd35d584d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bW9uc3RlcmF8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"
# )

# Plant.create!(
#   name: "Rubber tree",
#   plant_url: "https://images.unsplash.com/photo-1477554193778-9562c28588c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cnViYmVyJTIwdHJlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"
# )

# Plant.create!(
#   name: "Tulip",
#   plant_url: "https://images.unsplash.com/photo-1518701005037-d53b1f67bb1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dHVsaXB8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"
# )



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

  # name = doc.search('h1').text
  name = doc.search('.range-revamp-header-section__title--big').text
  # year = doc.search('.TitleBlockMetaData__StyledTextLink-sc-12ein40-1').first.text.match(/(?<year>\d{4})/)[:year].to_i
  # binding.pry
  description = doc.search('p.range-revamp-product-summary__description').text
  plant_url = doc.search('.range-revamp-aspect-ratio-image__image').attribute('src').value
  # p plant_url
  # director = doc.search('.ipc-metadata-list__item:contains("Director") a').first.text
  # cast = doc.search('.ipc-metadata-list__item:contains("Stars") a.ipc-metadata-list-item__list-content-item').map { |element| element.text }.uniq
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
puts urls

urls.map do |url|
  puts "Scraping #{url}"
  plants_hashes << scrape_plant(url)
end

puts "Creating plants."

plants_hashes.each do |plant|
  # plant = {:name=>"DISCHIDIA", :description=>"You can hang up this plant right away, or plant it in another pot if you like. With hanging plants, you can create a lush wall of greenery that makes the home feel more vibrant and lifts your well-being."}
  Plant.create(name: plant[:name], description: plant[:description], plant_url: plant[:plant_url])
end

puts "#{Plant.count} plants created."

puts 'Creating garden kits...'

GardenKit.create!(
  kit_name: "British garden",
  plant_id: Plant.first.id,
  kit_url: "https://images.unsplash.com/photo-1558293842-c0fd3db86157?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2FyZGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
)

GardenKit.create!(
  kit_name: "Hello Spring",
  plant_id: Plant.last.id,
  kit_url: "https://images.unsplash.com/photo-1490750967868-88aa4486c946?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3ByaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"
)

puts 'Finished!'
