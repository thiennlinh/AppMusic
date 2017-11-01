class Micropost < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :title, presence: true, length: { maximum: 156 }
  validates :url, presence: true
  validates :genre, presence: true
end
