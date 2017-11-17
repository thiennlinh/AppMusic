class Community < ApplicationRecord
    acts_as_votable cacheable_strategy: :update_columns
    validates :title, presence: true
    validates :description, presence: true
    validates :user_id, presence: true
    has_many :microposts, dependent: :destroy
    default_scope -> { order(cached_votes_score: :desc) }
end
