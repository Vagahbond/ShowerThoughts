class Thumb < ApplicationRecord
  validates_associated :showerthought, :user
  belongs_to :user
  belongs_to :showerthought
end
