if City.count.zero?
  path = File.join(File.dirname(__FILE__), './seeds/cities.json')
  cities_data = JSON.parse(File.read(path))
  cities_data.each do |city|
    City.create!(name: city['city'])
  end
  puts 'Cities are seeded'
end
