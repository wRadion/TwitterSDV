class User < ApplicationRecord
  has_many :tweets

  has_secure_password

  validates :email, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :name, presence: true, length: { minimum: 3 }
end
