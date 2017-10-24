class Comment < ApplicationRecord
  belongs_to :post
  validates :commenter, presence: true
end