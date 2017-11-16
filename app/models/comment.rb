class Comment < ApplicationRecord
  acts_as_votable cacheable_strategy: :update_columns
  default_scope -> { order(cached_votes_score: :desc) }
  validates :user_id, presence: true
  validates :parent_id, presence: true
  validates :body, presence: true
  belongs_to :micropost
end
