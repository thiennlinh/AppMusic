class Comment < ApplicationRecord
  acts_as_votable
  default_scope -> { order(cached_votes_score: :desc) }
  belongs_to :micropost
end
