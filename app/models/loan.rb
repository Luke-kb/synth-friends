class Loan < ApplicationRecord
  belongs_to :listing
  has_one :lender, class_name: "Profile"
  has_one :renter, class_name: "Profile"
  
end
