class Listing < ApplicationRecord
  has_one :brand
  has_one :listing
  has_one_attached :image
  #self-join setup
  belongs_to :lender, class_name: "Profile"
  belongs_to :renter, class_name: "Profile", optional: true
end
