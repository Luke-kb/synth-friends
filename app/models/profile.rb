class Profile < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_one_attached :photo

end
