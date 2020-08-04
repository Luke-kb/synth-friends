class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :lender, class_name: "Profile"
  belongs_to :renter, class_name: "Profile", optional: true
  has_many_attached :image
end
