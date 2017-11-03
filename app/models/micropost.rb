class Micropost < ApplicationRecord
  acts_as_votable
  has_many :comments
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(cached_votes_score: :desc) }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :title, presence: true, length: { maximum: 156 }
  validates :url, presence: true
  validates :genre, presence: true
end
