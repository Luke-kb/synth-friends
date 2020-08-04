# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brands_array = [
    "Arturia", "Moog", "Korg", "Elektron", "Dave Smith Instruments", "Yamaha", "Access", "Waldorf"
]

categories_array = [
    "Keyboard Synth", "Desktop Synth", "Effects", "Midi Controller", "Modular", "Accessories"
]

brands_array.each do |brand|
    Brand.create(name: brand)
end

categories_array.each do |category|
    Category.create(name: category)
end
