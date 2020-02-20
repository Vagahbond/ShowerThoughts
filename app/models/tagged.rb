class Tagged < ApplicationRecord
  validates_associated :showerthought, :tag
  belongs_to :tag
  belongs_to :showerthought

end
