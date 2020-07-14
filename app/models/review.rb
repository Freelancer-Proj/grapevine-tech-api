class Review < ApplicationRecord
    validates :content, presence: true
    validates :reviewer, presence: true
end
