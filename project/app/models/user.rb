class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password_digest, confirmation: true, length: { minimum: 6 }
  validates :headline,  length: { maximum: 30 }
  validates :tube_description, length: { maximum: 500 }
  validates :link,  length: { maximum: 70 }

  def self.authenticate(email, submitted_password)
    user = find_by(email: email)
    return nil if user.nil?
    return user if user.authenticate(submitted_password)
  end
end
