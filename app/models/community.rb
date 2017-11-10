class Community < ApplicationRecord
    acts_as_votable cacheable_strategy: :update_columns
    validates :title, presence: true
    has_many :microposts, dependent: :destroy
end
