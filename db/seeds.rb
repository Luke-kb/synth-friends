# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'aws-sdk-s3'

# User.destroy_all
# Category.destroy_all
# Brand.destroy_all
# Listing.destroy_all
# Profile.destroy_all
# Loan.destroy_all
# Rating.destroy_all

puts "start loading data"

brands_array = [
    "Arturia", "Moog", "Korg", "Elektron", "Dave Smith Instruments", "Yamaha", "Access", "Waldorf"
]

categories_array = [
    "Keyboard Synth", "Desktop Synth", "Effects", "Midi", "Modular", "Accessories"
]

brands_array.each do |brand|
    Brand.create!(name: brand)
end

categories_array.each do |category|
    Category.create!(name: category)
end

user1 = User.create! :email => 'bob@test.com', :password => 'password', :password_confirmation => 'password', :admin => false
user2 = User.create! :email => 'flik@test.com', :password => 'password', :password_confirmation => 'password', :admin => false
admin = User.create! :email => 'admin@test.com', :password => 'adminpassword', :password_confirmation => 'adminpassword', :admin => true
listing1 = Listing.create! :brand => 1, :title => 'MatrixBrute', :category => 1, :description => "analog monosynth", :price => 30, :year_of_manufacture => 2012, :availabity => true, lender_id => user1.id, renter_id => user2.id
listing2 = Listing.create! :brand => 2, :title => 'MiniMoog Voyager XL', :category => 1, :description => "famed analog monosynth", :price => 40, :year_of_manufacture => 2010, :availabity => true
loan1 = Loan.create! = :listing_id => listing1.id, :start_date => DateTime.strptime("08/07/2020 17:00", "%m/%d/%Y %H:%M"), :end_date => DateTime.strptime("08/09/2020 17:00", "%m/%d/%Y %H:%M"), :total_cost => (listing1.price*2)


puts "finish loading data"

# s3 = Aws::S3::Resource.new(region: 'ap-southeast-2')



# 20.times do |i|
#     item = Item.create!(
    #                     title: Faker::Games::Pokemon.name,
#                     description: Faker::Lorem.paragraph_by_chars(60, false),
#                     price: 5.0)

    # Create the object to retrieve
    # obj = s3.bucket('my-bucket').object('#{i}.jpg')    # change this to your bucket name

    # Get the item's content and save it to local
    # obj.get(response_target: 'app/assets/images/chatons/#{i}.jpg')

    # item.image.attach(io: File.open("app/assets/images/chatons/#{i}.jpg"), filename: "#{i}.jpg")


