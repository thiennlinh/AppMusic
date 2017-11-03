class Comment < ApplicationRecord
  acts_as_votable cacheable_strategy: :update_columns
  default_scope -> { order(cached_votes_score: :desc) }
  belongs_to :micropost
end
