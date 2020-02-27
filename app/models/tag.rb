class Tag < ApplicationRecord
  validates :name, presence: true
  validates_associated :taggeds
  has_many :taggeds
  validates_uniqueness_of :name
end
