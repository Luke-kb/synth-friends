class Listing < ApplicationRecord
  has_one :brand
  has_one :category
  has_one_attached :image   #image upload (ActiveStorage)
  #self-join setup
  belongs_to :lender, class_name: "Profile"
  belongs_to :renter, class_name: "Profile", optional: true
  validate :check_image_filetype  # validation for image upload


  private
  # validation method
  def check_image_filetype
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, 'image must be JPEG or PNG')  
    elsif image.attached? == false
      errors.add(:image, 'needs to be added.')
    end
  end
end