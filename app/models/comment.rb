class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :showerthought
  validates :content, presence: true
  validates_associated :showerthought, :user


end
