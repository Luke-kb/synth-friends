class Profile < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_one_attached :image
  #self join setup
  has_many :listings_to_lend, class_name: "Listing", foreign_key: "lender_id"
  has_many :listings_to_rent, class_name: "Listing", foreign_key: "renter_id"

end
