class Community < ApplicationRecord
    validates :title, presence: true
end
