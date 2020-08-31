# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#initialize facilities
facilities = ["Washer/Dryer", "Internet", "Garage"]
facilities.each do |f|
  Facility.create!(name: f)
end

#initialize property types
property_types = ["Apartment", "Home"]
property_types.each do |f|
  PropertyType.create!(name: f)
end

# initialize images for s3


#initialize properties
6.times {
  prop = Property.create! do |p|
    p.title = "Residential " + Faker::Demographic.demonym + " Home"
    p.description = Faker::Lorem.paragraph(sentence_count: 20)
    p.price = Faker::Number.number(digits: 6)
    p.address_line_1 = Faker::Address.street_address
    p.city = Faker::Address.city_prefix
    p.state = Faker::Address.state
    p.rating = Faker::Number.between(from: 1, to: 5)
  end

  2.times do
    image = Down.download(Faker::LoremFlickr.image(size: "1700x1700", search_terms: ['house']))
    prop.property_images.attach(io: image.open, filename: image.original_filename)
  end
}
