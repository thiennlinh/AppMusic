class Micropost < ApplicationRecord
  acts_as_votable cacheable_strategy: :update_columns
  has_many :polycoms, as: :commentable, dependent: :destroy
  belongs_to :user
  has_and_belongs_to_many :playlists
  validates :user_id, presence: true
  default_scope -> { order(cached_votes_score: :desc) }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :title, presence: true, length: { maximum: 156 }
  validates :artist, presence: true
  validates :community_id, presence: true
end
