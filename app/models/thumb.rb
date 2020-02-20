class Thumb < ApplicationRecord
  validates :direction, presence: true
  validates_associated :showerthought, :user
  belongs_to :user
  belongs_to :showerthought
end
