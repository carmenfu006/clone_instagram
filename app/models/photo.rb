class Photo < ApplicationRecord
  has_one_attached :file
  has_many :comments

  belongs_to :user
end
