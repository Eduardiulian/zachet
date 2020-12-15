class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, confirmation: true, length: { minimum: 4 }
  validates :headline,  length: { maximum: 30 }
  validates :tube_description, length: { maximum: 500 }
  validates :link,  length: { maximum: 70 }
end
