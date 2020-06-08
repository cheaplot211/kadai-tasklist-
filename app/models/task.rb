class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :status, presence: true, length: { maximum: 50 }
  belongs_to :user
end
