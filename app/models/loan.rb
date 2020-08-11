class Loan < ApplicationRecord
  before_save :calculate_total_cost 
  belongs_to :listing
  has_one :lender, class_name: "Profile"
  has_one :renter, class_name: "Profile"
  
  def calculate_total_cost
    self.total_cost = ((end_date.to_date - start_date.to_date) * listing.price)
  end
end