class Showerthought < ApplicationRecord
  validates :content, :context, presence: true
  validates_associated :user
  belongs_to :user
  has_many :thumbs
  has_many :comments
end
