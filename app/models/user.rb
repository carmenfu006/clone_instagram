class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
end