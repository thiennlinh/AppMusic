class Polycom < ApplicationRecord
    acts_as_votable cacheable_strategy: :update_columns
    belongs_to :commentable, polymorphic: true
    has_many :polycoms, as: :commentable
end
