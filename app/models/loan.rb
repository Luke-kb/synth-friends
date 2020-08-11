class Loan < ApplicationRecord
  before_save :calculate_total_cost   #crun alculate total cost method before saving new loan!
  belongs_to :listing
  has_one :lender, class_name: "Profile"
  has_one :renter, class_name: "Profile"
  
  private
  def calculate_total_cost
    #calculate the total cost of 'self' instance of loan model
    self.total_cost = ((end_date.to_date - start_date.to_date) * listing.price)
  end
end