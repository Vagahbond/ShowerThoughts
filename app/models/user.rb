class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, :password, presence: true

  has_many :thumbs
  has_many :comments
end
