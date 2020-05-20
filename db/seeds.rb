# frozen_string_literal: true

if City.count.zero?
  path = File.join(File.dirname(__FILE__), './seeds/cities.json')
  cities_data = JSON.parse(File.read(path))
  cities_data.each do |city|
    City.create!(name: city['city'])
  end
end

User.create!(first_name: 'Пользователь', second_name: 'Пользователь', email: 'user@user.ru', password: '123456789', phone: '12345678912', city_id: 1)

Admin.create!(name: 'Админ', email: 'admin@admin.ru', password: '123456789')
