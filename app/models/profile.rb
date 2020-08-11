class Profile < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_one_attached :image
  #self join setup
  has_many :listings_to_lend, class_name: "Listing", foreign_key: "lender_id"
  has_many :listings_to_rent, class_name: "Listing", foreign_key: "renter_id"
  validates :location, length: {maximum: 4, minimum: 4}
  validate :check_image_filetype  # validation for image upload


  private
  def check_image_filetype
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, 'image must be JPEG or PNG')  
    elsif image.attached? == false
      errors.add(:image, 'needs to be added.')
    end
  end

end
