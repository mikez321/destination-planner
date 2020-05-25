
# class Seed
#   def self.start
#     seed = Seed.new
#     seed.generate_destinations
#   end
#
#   def generate_destinations
#     50.times do |i|
#       dest = Destination.create!(
#         name: Faker::Address.city,
#         zip: Faker::Address.zip,
#         description: Faker::Lorem.sentence,
#         image_url: Faker::Placeholdit.image
#       )
#       puts "Destination #{i}: #{dest.name} created!"
#     end
#   end
# end
#
# Seed.start
tlh = Destination.create(name: 'Tallahassee',
                         zip: '32317',
                         description: 'Near the Florida Georgia Line',
                         image_url: Faker::Placeholdit.image)

rich = Destination.create(name: 'Richmond',
                          zip: '23221',
                          description: 'Home of Cary St. Cafe',
                          image_url: Faker::Placeholdit.image)
jax = Destination.create(name: 'Jacksonville',
                         zip: '32034',
                         description: 'Flat',
                         image_url: Faker::Placeholdit.image)

dc = Destination.create(name: 'Washington DC',
                        zip: '20005',
                        description: 'Center of the world',
                        image_url: Faker::Placeholdit.image)
