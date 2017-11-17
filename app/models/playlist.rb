class Playlist < ApplicationRecord
	has_and_belongs_to_many :microposts
	belongs_to :user
	validates :user_id, presence: true
	validates :name, presence: true, length: { maximum: 64 }
end
