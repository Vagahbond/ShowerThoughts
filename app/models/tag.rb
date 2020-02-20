class Tag < ApplicationRecord
  validates :name, presence: true
  validates_associated :taggeds
  has_many :taggeds
end
