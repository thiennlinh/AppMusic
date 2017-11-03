class Playlist < ApplicationRecord
	has_and_belongs_to_many :microposts
end
